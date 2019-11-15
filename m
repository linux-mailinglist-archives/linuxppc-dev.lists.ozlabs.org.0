Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7165DFD965
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 10:34:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DtTp6l1czF6kV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 20:34:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DtRf2NymzF5sd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 20:32:29 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EA298B225;
 Fri, 15 Nov 2019 09:32:26 +0000 (UTC)
Date: Fri, 15 Nov 2019 10:32:19 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: WARN_ONCE does not warn once
Message-ID: <20191115093219.GA24518@kitsune.suse.cz>
References: <20191114164655.GH11661@kitsune.suse.cz>
 <20191114194417.GI11661@kitsune.suse.cz>
 <875zjleolv.fsf@mpe.ellerman.id.au>
 <20191115084434.GJ11661@kitsune.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191115084434.GJ11661@kitsune.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 15, 2019 at 09:44:34AM +0100, Michal Suchánek wrote:
> On Fri, Nov 15, 2019 at 03:43:24PM +1100, Michael Ellerman wrote:
> > Michal Suchánek <msuchanek@suse.de> writes:
> > > On Thu, Nov 14, 2019 at 05:46:55PM +0100, Michal Suchánek wrote:
> > >> Hello,
> > >> 
> > >> on powernv with 5.3.8 kernel I get flood of messages on boot.
> > >> 
> > >> The messages match WARN_ONCE(1, "opal: OPAL_CONSOLE_FLUSH missing.\n");
> > >
> > > Asking around it was pointed out that WARN_ONCE warns up to as many
> > > times as you have CPUs.
> > 
> > Does it?
> > 
> > > Did not bother counting the messages but it may very well be the case it
> > > is printed once for each CPU.
> > 
> > The way it's implemented is slightly racy, but I'd be surprised if every
> > CPU hit that race all at once.
> 
> Printing a warn_once this early probably forces some peculiar timing.
> grep  WARN.*__opal_flush_console dmesg.txt | wc -l gives exactly the
> number of CPUs as shown by lscpu.
> 
And this dose not change with enforcing once using an atomic.

diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index d271accf224b..dd870124b804 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -425,6 +425,7 @@ static s64 __opal_flush_console(uint32_t vtermno)
 	s64 rc;
 
 	if (!opal_check_token(OPAL_CONSOLE_FLUSH)) {
+		static atomic_t warned;
 		__be64 evt;
 
 		/*
@@ -432,7 +433,8 @@ static s64 __opal_flush_console(uint32_t vtermno)
 		 * the console can still be flushed by calling the polling
 		 * function while it has OPAL_EVENT_CONSOLE_OUTPUT events.
 		 */
-		WARN_ONCE(1, "opal: OPAL_CONSOLE_FLUSH missing.\n");
+		if (!atomic_xchg(&warned, 1))
+			WARN(1, "opal: OPAL_CONSOLE_FLUSH missing.\n");
 
 		opal_poll_events(&evt);
 		if (!(be64_to_cpu(evt) & OPAL_EVENT_CONSOLE_OUTPUT))

Something more tricky is going on.

Thanks

Michal

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1574F34E3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 17:45:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4788QK4vZDzF6GJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 03:44:57 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4788N11QL8zF4Wk
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2019 03:42:55 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A2760AE6F;
 Thu,  7 Nov 2019 16:42:49 +0000 (UTC)
Date: Thu, 7 Nov 2019 17:42:48 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH] powerpc/fadump: Remove duplicate message.
Message-ID: <20191107164248.GZ1384@kitsune.suse.cz>
References: <20190923075406.5854-1-msuchanek@suse.de>
 <20191023175651.24833-1-msuchanek@suse.de>
 <aa26db2d-48b5-5825-81ab-12ca491a9971@linux.ibm.com>
 <20191024111651.GL938@kitsune.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191024111651.GL938@kitsune.suse.cz>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 24, 2019 at 01:16:51PM +0200, Michal Suchánek wrote:
> On Thu, Oct 24, 2019 at 04:08:08PM +0530, Hari Bathini wrote:
> > 
> > Michal, thanks for looking into this.
> > 
> > On 23/10/19 11:26 PM, Michal Suchanek wrote:
> > > There is duplicate message about lack of support by firmware in
> > > fadump_reserve_mem and setup_fadump. Due to different capitalization it
> > > is clear that the one in setup_fadump is shown on boot. Remove the
> > > duplicate that is not shown.
> > 
> > Actually, the message in fadump_reserve_mem() is logged. fadump_reserve_mem()
> > executes first and sets fw_dump.fadump_enabled to `0`, if fadump is not supported.
> > So, the other message in setup_fadump() doesn't get logged anymore with recent
> > changes. The right thing to do would be to remove similar message in setup_fadump() instead.
> 
> I need to re-check with a recent kernel build. I saw the message from
> setup_fadump and not the one from fadump_reserve_mem but not sure what
> the platform init code looked like in the kernel I tested with.

Indeed, I was missing the patch that changes the capitalization in
fadump_reserve_mem. In my kernel both messages are the same and the one
from fadump_reserve_mem is displayed.

Thanks

Michal

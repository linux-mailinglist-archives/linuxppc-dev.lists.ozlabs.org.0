Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A7622373C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 10:37:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7PdB1zdyzDr1Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 18:37:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7PZm4nX2zDqyj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 18:35:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B7PZm0t2dz9CDr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 18:35:28 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B7PZm0MFyz9sTC; Fri, 17 Jul 2020 18:35:28 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B7PZl4P4qz9sR4
 for <linuxppc-dev@ozlabs.org>; Fri, 17 Jul 2020 18:35:26 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DF2D5B636;
 Fri, 17 Jul 2020 08:35:26 +0000 (UTC)
Date: Fri, 17 Jul 2020 10:35:21 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH v3] powerpc/pseries: detect secure and trusted boot state
 of the system.
Message-ID: <20200717083521.GK32107@kitsune.suse.cz>
References: <1594813921-12425-1-git-send-email-nayna@linux.ibm.com>
 <20200716081337.GB32107@kitsune.suse.cz>
 <87pn8uu1hy.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pn8uu1hy.fsf@dja-thinkpad.axtens.net>
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
Cc: linuxppc-dev@ozlabs.org, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 17, 2020 at 03:58:01PM +1000, Daniel Axtens wrote:
> Michal Suchánek <msuchanek@suse.de> writes:
> 
> > On Wed, Jul 15, 2020 at 07:52:01AM -0400, Nayna Jain wrote:
> >> The device-tree property to check secure and trusted boot state is
> >> different for guests(pseries) compared to baremetal(powernv).
> >> 
> >> This patch updates the existing is_ppc_secureboot_enabled() and
> >> is_ppc_trustedboot_enabled() functions to add support for pseries.
> >> 
> >> The secureboot and trustedboot state are exposed via device-tree property:
> >> /proc/device-tree/ibm,secure-boot and /proc/device-tree/ibm,trusted-boot
> >> 
> >> The values of ibm,secure-boot under pseries are interpreted as:
> >                                       ^^^
> >> 
> >> 0 - Disabled
> >> 1 - Enabled in Log-only mode. This patch interprets this value as
> >> disabled, since audit mode is currently not supported for Linux.
> >> 2 - Enabled and enforced.
> >> 3-9 - Enabled and enforcing; requirements are at the discretion of the
> >> operating system.
> >> 
> >> The values of ibm,trusted-boot under pseries are interpreted as:
> >                                        ^^^
> > These two should be different I suppose?
> 
> I'm not quite sure what you mean? They'll be documented in a future
> revision of the PAPR, once I get my act together and submit the
> relevant internal paperwork.

Nevermind, one talks about secure boot, the other about trusted boot.

Thanks

Michal

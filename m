Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7559C84BBC3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 18:24:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VbH/xjJY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTqqX2k6fz3cST
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 04:24:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VbH/xjJY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TTqpk52HCz3c9G
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Feb 2024 04:23:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D16ABCE14E7;
	Tue,  6 Feb 2024 17:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C145DC433F1;
	Tue,  6 Feb 2024 17:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707240217;
	bh=po8vFxWrgnIMI30IcGK3wKjOx+diDmMTZZJBoYh+eQs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=VbH/xjJYNUgcSHYX8q6R3XOgMBMYdLFz0wwh7u9in+aDxvfieDaQsfcKyvc8IJljm
	 b4KjHmApQTFpV3dO3iDbgzIq452iChe4Hlh+NbWkOfvbUZAwcqMJKOmdrdWJDvx820
	 yGKAU6o3UzpUqJtxSEDdVVdgjfhrjOOzt539Zz72GbRfzqXZni2RnBmRWm0weRDqIa
	 abarX5VsT/PfIoUpx71JSSklbKAA2HtBv69vFwRwxqV13L9xCWMblKCxtAmGpAIqwi
	 8sqKs24ZwA9C+e3TEvivW9S6Jps4z6qQAk8w70V+oieQDehciCMb6nvmk5plKPIwiL
	 i1EveBd1FnZ6A==
Date: Tue, 6 Feb 2024 11:23:35 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
Subject: Re: [PATCH v2 1/4] PCI/AER: Store more information in aer_err_info
Message-ID: <20240206172335.GA872811@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2rfnevhnhylik4r6smr56uunsxweo7s5elo65sjhiztvxnr6bq@5fcyv22zxyyp>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Alison Schofield <alison.schofield@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org, erwin.tsaur@intel.com, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, chao.p.peng@linux.intel.com, Ira Weiny <ira.weiny@intel.com>, Davidlohr Bueso <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>, linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>, Robert Richter <rrichter@amd.com>, Borislav Petkov <bp@alien8.de>, Jonathan Cameron <jonathan.cameron@huawei.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>, feiting.wanyan@intel.com, qingshun.wang@intel.com, Adam Preble <adam.c.preble@intel.com>, Mahesh J Salgaonk
 ar <mahesh@linux.ibm.com>, Li Yang <leoyang.li@nxp.com>, Lukas Wunner <lukas@wunner.de>, James Morse <james.morse@arm.com>, linuxppc-dev@lists.ozlabs.org, Shiju Jose <shiju.jose@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 07, 2024 at 12:41:41AM +0800, Wang, Qingshun wrote:
> On Mon, Feb 05, 2024 at 05:12:31PM -0600, Bjorn Helgaas wrote:
> > On Thu, Jan 25, 2024 at 02:27:59PM +0800, Wang, Qingshun wrote:
> > > When Advisory Non-Fatal errors are raised, both correctable and
> > > uncorrectable error statuses will be set. The current kernel code cannot
> > > store both statuses at the same time, thus failing to handle ANFE properly.
> > > In addition, to avoid clearing UEs that are not ANFE by accident, UE
> > > severity and Device Status also need to be recorded: any fatal UE cannot
> > > be ANFE, and if Fatal/Non-Fatal Error Detected is set in Device Status, do
> > > not take any assumption and let UE handler to clear UE status.
> > > 
> > > Store status and mask of both correctable and uncorrectable errors in
> > > aer_err_info. The severity of UEs and the values of the Device Status
> > > register are also recorded, which will be used to determine UEs that should
> > > be handled by the ANFE handler. Refactor the rest of the code to use
> > > cor/uncor_status and cor/uncor_mask fields instead of status and mask
> > > fields.
> > 
> > There's a lot going on in this patch.  Could it possibly be split up a
> > bit, e.g., first tease apart aer_err_info.status/.mask into
> > .cor_status/mask and .uncor_status/mask, then add .uncor_severity,
> > then add the device_status bit separately?  If it could be split up, I
> > think the ANFE case would be easier to see.
> 
> Thanks for the feedback! Will split it up into two pacthes in the next
> version.

Or even three:

  1) tease apart aer_err_info.status/.mask into .cor_status/mask and
     .uncor_status/mask

  2) add .uncor_severity

  3) add device_status

Looking at this again, I'm a little confused about 2) and 3).  I see
the new read of PCI_ERR_UNCOR_SEVER into .uncor_severity, but there's
no actual *use* of it.

Same for 3), I see the new read of PCI_EXP_DEVSTA, but AFAICS there's
no use of that value.

We should have the addition of these new values in the same patch
that *uses* them.

Bjorn

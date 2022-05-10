Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A26B52218A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 18:43:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyP4g0sZQz3cMf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 02:43:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SG253sua;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SG253sua; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyP4315Rfz3bsF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 02:43:14 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8BA1861811;
 Tue, 10 May 2022 16:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3C14C385A6;
 Tue, 10 May 2022 16:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652200991;
 bh=Osg1O0gfa6ZkJPjBpOrkM1rXaweWgHooysorOXbKftU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=SG253suakgSw/EN+cXtrkyjj6aWCkxwrbCbP7C0HSUz/KfL9A6Vx4aeAY6gHLL/zK
 Ig/jhuTc7srNJMuXg8I3xGqrmiHxoSwZQiu5XNG+vcxoeaNuD8SwYUmAwdpg2PvtsX
 MpPy2zHkZCbErrHZecpOuX2nCTX41ds2hoJA0idx7X7ROHLRuS93+5p7XfBG9vBJBD
 +vkSNa3ypaT5L6QmF6BfBVCSIK9q3bhncdsZ5Yu4H/cJ+Yulisq7PiKnwg/z/cBrCR
 mVqqxmHRCgXEPo2OqbB+8jN15fPu9j2moaT3HEQDubZBxY0v4EEMpEQZCjIxPT4y4b
 YYOf7ALzDkFLw==
Date: Tue, 10 May 2022 11:43:05 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Subject: Re: [PATCH] PCI/AER: Iterate over error counters instead of error
 strings
Message-ID: <20220510164305.GA678149@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509181441.31884-1-mkhalfella@purestorage.com>
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
Cc: "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Meeta Saggi <msaggi@purestorage.com>,
 Eric Badger <ebadger@purestorage.com>, Oliver O'Halloran <oohall@gmail.com>,
 stable@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Rajat Jain <rajatja@google.com>,
 "open list:PCI ENHANCED ERROR HANDLING \(EEH\) FOR POWERPC"
 <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[+cc Rajat]

On Mon, May 09, 2022 at 06:14:41PM +0000, Mohamed Khalfella wrote:
> PCI AER stats counters sysfs attributes need to iterate over
> stats counters instead of stats names. 

Thanks for catching this; it definitely looks like a real issue!  I
guess you're probably seeing junk in the sysfs files?

It would be helpful to reviewers if this said *why* we need to iterate
over the counters instead of the names.  I think the problem is that
the current code reads past the end of the stats counters.

There are parallel arrays here:

  #define AER_MAX_TYPEOF_COR_ERRS         16
  #define AER_MAX_TYPEOF_UNCOR_ERRS       27

  aer_correctable_error_string[32]                               # 32
  pdev->aer_stats->dev_cor_errs[AER_MAX_TYPEOF_COR_ERRS]         # 16
  aer_uncorrectable_error_string[32]                             # 32
  pdev->aer_stats->dev_fatal_errs[AER_MAX_TYPEOF_UNCOR_ERRS]     # 27
  pdev->aer_stats->dev_nonfatal_errs[AER_MAX_TYPEOF_UNCOR_ERRS]  # 27

And here's the current use of them:

  #define aer_stats_dev_attr(..., stats_array, strings_array, ...)
    for (i = 0; i < ARRAY_SIZE(strings_array); i++) {
      if (strings_array[i])
	sysfs_emit_at(..., strings_array[i], stats[i]);          (1)
      else if (stats[i])
	sysfs_emit_at(..., stats[i]);                            (2)

  aer_stats_dev_attr(..., dev_cor_errs, aer_correctable_error_string,
  aer_stats_dev_attr(..., dev_fatal_errs, aer_uncorrectable_error_string,
  aer_stats_dev_attr(..., dev_nonfatal_errs, aer_uncorrectable_error_string,

The current loop iterates over 0..31, which is safe at (1) because the
non-NULL strings are at aer_correctable_error_string[0..15] and
aer_uncorrectable_error_string[0..26].

But it is unsafe at (2) because it references dev_cor_errs[16..31],
dev_fatal_errs[27..31], and dev_nonfatal_errs[27..31], which are past
the end of the arrays.

> Also, added a build time check to make sure all counters have
> entries in strings array.
>
> Fixes: 0678e3109a3c ("PCI/AER: Simplify __aer_print_error()")

Yep, I blew it there.  Rajat did it correctly when he added this with
81aa5206f9a7 ("PCI/AER: Add sysfs attributes to provide AER stats and
breakdown"), and I broke it by extending the string arrays to 32
entries.

> Cc: stable@vger.kernel.org
> Reported-by: Meeta Saggi <msaggi@purestorage.com>
> Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> Reviewed-by: Meeta Saggi <msaggi@purestorage.com>
> Reviewed-by: Eric Badger <ebadger@purestorage.com>
> ---
>  drivers/pci/pcie/aer.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 9fa1f97e5b27..ce99a6d44786 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -533,7 +533,7 @@ static const char *aer_agent_string[] = {
>  	u64 *stats = pdev->aer_stats->stats_array;			\
>  	size_t len = 0;							\
>  									\
> -	for (i = 0; i < ARRAY_SIZE(strings_array); i++) {		\
> +	for (i = 0; i < ARRAY_SIZE(pdev->aer_stats->stats_array); i++) {\
>  		if (strings_array[i])					\
>  			len += sysfs_emit_at(buf, len, "%s %llu\n",	\
>  					     strings_array[i],		\

I think maybe we should populate the currently NULL entries in the
string[] arrays and simplify the code here, e.g.,

  static const char *aer_correctable_error_string[] = {
        "RxErr",                        /* Bit Position 0       */
        "dev_cor_errs_bit[1]",
	...

  if (stats[i])
    len += sysfs_emit_at(buf, len, "%s %llu\n", strings_array[i], stats[i]);

It's a little more data space, but easier to verify.

> @@ -1342,6 +1342,11 @@ static int aer_probe(struct pcie_device *dev)
>  	struct device *device = &dev->device;
>  	struct pci_dev *port = dev->port;
>  
> +	BUILD_BUG_ON(ARRAY_SIZE(aer_correctable_error_string) <
> +		     AER_MAX_TYPEOF_COR_ERRS);
> +	BUILD_BUG_ON(ARRAY_SIZE(aer_uncorrectable_error_string) <
> +		     AER_MAX_TYPEOF_UNCOR_ERRS);

And make these check for "!=" instead of "<".

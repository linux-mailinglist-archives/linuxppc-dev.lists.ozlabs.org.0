Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B06BD397774
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 18:05:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FvcSH5hVPz2yxY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 02:05:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DH17Kwsx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DH17Kwsx; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvcRt1TPpz2yXX
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 02:04:41 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0EB7860232;
 Tue,  1 Jun 2021 16:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622563449;
 bh=/ypgGqL0v+wsCgxDS8k0oLpREu5q7GxXgSi43vcKhcw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=DH17KwsxplYIBl3YflGFUaRCGNMjISN1k6KMivXnfOqr5k0Q3eQWdrkFOp/lzW/1g
 fPv+4slyk5DCica+zDVOHa/+hMq5PcqCuVFyCYeLdg/VKfzNPrV+1mFrLQ9vJ/TxrD
 ljfdK7MP0vekepdZtNmFDoltBRGXzTwArD0hjVb/+MVn2/mHY4HMhexmShffv5w7m5
 8I6qHHL6zC4YginEDR6Ho/UWPedEtB4pyAV5Lx7yzhr1Kmo1+1nIWNIFUIsyRyi+N6
 Q87kXii61tZKgkMYYZLQthvPOo2jhRJw4I25FNLHH6o3nmrqe0ihANcJ5A1siIwf4J
 6OcH6tucNV2Kw==
Date: Tue, 1 Jun 2021 11:04:02 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Wesley Sheng <wesley.sheng@amd.com>
Subject: Re: [PATCH] Documentation PCI: Fix typo in pci-error-recovery.rst
Message-ID: <20210601160402.GA1944037@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210531081215.43507-1-wesley.sheng@amd.com>
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
Cc: wesleyshenggit@sina.com, corbet@lwn.net, linux-pci@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, oohall@gmail.com,
 bhelgaas@google.com, linasvepstas@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 31, 2021 at 04:12:15PM +0800, Wesley Sheng wrote:
> Replace "It" with "If", since it is a conditional statement.
> 
> Signed-off-by: Wesley Sheng <wesley.sheng@amd.com>

Applied to pci/error for v5.14 with Krzysztof's reviewed-by and
subject "Documentation: PCI: Fix typo in pci-error-recovery.rst" to
match previous convention, thanks!

> ---
>  Documentation/PCI/pci-error-recovery.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/PCI/pci-error-recovery.rst b/Documentation/PCI/pci-error-recovery.rst
> index 84ceebb08cac..187f43a03200 100644
> --- a/Documentation/PCI/pci-error-recovery.rst
> +++ b/Documentation/PCI/pci-error-recovery.rst
> @@ -295,7 +295,7 @@ and let the driver restart normal I/O processing.
>  A driver can still return a critical failure for this function if
>  it can't get the device operational after reset.  If the platform
>  previously tried a soft reset, it might now try a hard reset (power
> -cycle) and then call slot_reset() again.  It the device still can't
> +cycle) and then call slot_reset() again.  If the device still can't
>  be recovered, there is nothing more that can be done;  the platform
>  will typically report a "permanent failure" in such a case.  The
>  device will be considered "dead" in this case.
> -- 
> 2.25.1
> 

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 940D680A9DB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 17:54:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gKbjRSiL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Smy1D0Ygwz3dFr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Dec 2023 03:54:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gKbjRSiL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Smy0Q5rFMz2xPb
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Dec 2023 03:54:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 9441DB82E67;
	Fri,  8 Dec 2023 16:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9764C433C7;
	Fri,  8 Dec 2023 16:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702054450;
	bh=rP/BoOBw5Wi94QQViNnTX6vvAn+7yt+JtMx5Ri2ncHg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=gKbjRSiLzKZGNfUhMQYIhifZWczNaZ9Eq9Y/tEFab9uHQVOGKz6HA/NHsmKfb4+F0
	 ziNTw7QEuFW3K1TVs+9ymfmioHfwlGaVZyDlztuDUlQkwOIqD8xt9R6GK+EOu/hedI
	 ClP8X+Mn4Hd8nHmb2plwGYUzPBX1w3eEUBWE5PoZ2Ct4LJT1mvPAZzxmR6omMexi+E
	 j4gojDtzEboOoouSbEhJR7yc53+v7J3Sw08YnRlXOQBURkjDHHNDs/VBLZP4dhEb1U
	 lKlhHNJT1rGCTRI3HPGWVnHEu/ov/1ssZpmNGReWp8NGD9cHvl7T5aPoKtxFpPxbd9
	 kRujdfw9HwrBA==
Date: Fri, 8 Dec 2023 10:54:08 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Subject: Re: [PATCH 0/3] PCI/AER: Clean up logging
Message-ID: <20231208165408.GA796794@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206224231.732765-1-helgaas@kernel.org>
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
Cc: Robert Richter <rrichter@amd.com>, Terry Bowman <terry.bowman@amd.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>, Oliver O'Halloran <oohall@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[+cc Jonathan]

On Wed, Dec 06, 2023 at 04:42:28PM -0600, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Clean up some minor AER logging issues:
> 
>   - Log as "Correctable errors", not "Corrected errors"
> 
>   - Decode the Requester ID when we couldn't find detail error info
> 
> Bjorn Helgaas (3):
>   PCI/AER: Use 'Correctable' and 'Uncorrectable' spec terms for errors
>   PCI/AER: Decode Requester ID when no error info found
>   PCI/AER: Use explicit register sizes for struct members
> 
>  drivers/pci/pcie/aer.c | 19 ++++++++++++-------
>  include/linux/aer.h    |  8 ++++----
>  2 files changed, 16 insertions(+), 11 deletions(-)

Applied to pci/aer for v6.8.  Thanks, Jonathan, for your time in
taking a look.

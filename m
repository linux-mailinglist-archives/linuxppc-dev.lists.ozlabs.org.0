Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F35BC4A6C84
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 08:52:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpYtb5qqGz3cRq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 18:52:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpYsx2Zzkz3bZb
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 18:52:05 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id D45AE67373; Wed,  2 Feb 2022 08:51:59 +0100 (CET)
Date: Wed, 2 Feb 2022 08:51:59 +0100
From: Christoph Hellwig <hch@lst.de>
To: guoren@kernel.org
Subject: Re: [PATCH V5 15/21] riscv: compat: Add hw capability check for elf
Message-ID: <20220202075159.GB18398@lst.de>
References: <20220201150545.1512822-1-guoren@kernel.org>
 <20220201150545.1512822-16-guoren@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220201150545.1512822-16-guoren@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>, linux-parisc@vger.kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org, drew@beagleboard.org,
 anup@brainfault.org, wangjunqiang@iscas.ac.cn, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, palmer@dabbelt.com, liush@allwinnertech.com,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de,
 linux-arm-kernel@lists.infradead.org, wefu@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 01, 2022 at 11:05:39PM +0800, guoren@kernel.org wrote:
> +bool compat_elf_check_arch(Elf32_Ehdr *hdr)
> +{
> +	if (compat_mode_support && (hdr->e_machine == EM_RISCV))
> +		return true;
> +	else
> +		return false;
> +}

This can be simplified to:

	return compat_mode_support && hdr->e_machine == EM_RISCV;

I'd also rename compat_mode_support to compat_mode_supported

> +
> +static int compat_mode_detect(void)
> +{
> +	unsigned long tmp = csr_read(CSR_STATUS);
> +
> +	csr_write(CSR_STATUS, (tmp & ~SR_UXL) | SR_UXL_32);
> +
> +	if ((csr_read(CSR_STATUS) & SR_UXL) != SR_UXL_32) {
> +		pr_info("riscv: 32bit compat mode detect failed\n");
> +		compat_mode_support = false;
> +	} else {
> +		compat_mode_support = true;
> +		pr_info("riscv: 32bit compat mode detected\n");
> +	}

I don't think we need these printks here.

Also this could be simplified to:

	compat_mode_supported = (csr_read(CSR_STATUS) & SR_UXL) == SR_UXL_32;

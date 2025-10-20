Return-Path: <linuxppc-dev+bounces-13053-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6459BF06F8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Oct 2025 12:10:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqrlc1jnlz300M;
	Mon, 20 Oct 2025 21:10:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:3000::53df:4ef0:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760955020;
	cv=none; b=iftuBRjPmNdyGkiRHFBDuOoN5Sv4EeIqvxuVrvOKJ+pAVjZ5Sh0ICf4r8i/g+KjeE5nY1Gz7KNePu+HSnEpTMPP2RQ3ZUqOrZvWlkMdtTEBSg2puYZ1xBaUJJ7AgR+OhtHEUQSMibe1dYlgdKOu7Y1/ROJY5ghXsgpWLeh0Nm1J5HCsnJEnadenazb3pkMmXCk1W3PbWwLmi8pPi6/wy2Zpdn01qoOX/yxOKUm9eExLQyDY2kfao+5wvV48p7qYRgBNfT1Iux6GrVImIwULpjEYJvYE7r6ne7BTfkCBBEwBjcQ972SGQpmMu4GNiT3EPbfPUM0jRxg9TghHzMzBxtw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760955020; c=relaxed/relaxed;
	bh=ab5Q/hjCXkl/MCUOSD6YHVxQpfmQzuAK9/LVDVJzc6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJPzroEFcz0Zbi491KmZwYgJq46ER0HHelKMJoiMErmKL9vsMpUlGF+IPqQjk+IbfgQgZKG5Kdnzjw0RdW3nZB9TqSHhdwVBq6SHYpn/4c88ScLL+vX5dGj3Uesc0Gly9Ff8AeXm0rfCspdPbgcN7MJQJppx4gLhj2Atx4L//YXwxXsgIGRoKqTSXv8SIpwFSpHiywA6ZiPtvROj8juY8vNlwylexfLJry181OEx01yhQ6z1LcnC6JycGIaHWuDeEKs8syy5igMtWOF3RHJN8zHeb9AXpj2gqYGI8DB9VxPY5yZIxqUP7LVKoC8PItrWIi+xa8rPOadgnJYdiv7+vw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout2.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout2.hostsharing.net (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [IPv6:2a01:37:3000::53df:4ef0:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cqrlZ4mxsz2yjw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Oct 2025 21:10:18 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 0554A20083D2;
	Mon, 20 Oct 2025 12:10:04 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id F38DE4A12; Mon, 20 Oct 2025 12:10:03 +0200 (CEST)
Date: Mon, 20 Oct 2025 12:10:03 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com,
	kbusch@kernel.org, sathyanarayanan.kuppuswamy@linux.intel.com,
	mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
	terry.bowman@amd.com, tianruidong@linux.alibaba.com
Subject: Re: [PATCH v6 3/5] PCI/AER: Report fatal errors of RCiEP and EP if
 link recoverd
Message-ID: <aPYKe1UKKkR7qrt1@wunner.de>
References: <20251015024159.56414-1-xueshuai@linux.alibaba.com>
 <20251015024159.56414-4-xueshuai@linux.alibaba.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015024159.56414-4-xueshuai@linux.alibaba.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 15, 2025 at 10:41:57AM +0800, Shuai Xue wrote:
> +++ b/drivers/pci/pcie/err.c
> @@ -253,6 +254,16 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>  			pci_warn(bridge, "subordinate device reset failed\n");
>  			goto failed;
>  		}
> +
> +		/* Link recovered, report fatal errors of RCiEP or EP */
> +		if (state == pci_channel_io_frozen &&
> +		    (type == PCI_EXP_TYPE_ENDPOINT || type == PCI_EXP_TYPE_RC_END)) {
> +			aer_add_error_device(&info, dev);
> +			info.severity = AER_FATAL;
> +			if (aer_get_device_error_info(&info, 0, true))
> +				aer_print_error(&info, 0);
> +			pci_dev_put(dev);
> +		}
>  	}

Where is the the pci_dev_get() to balance the pci_dev_put() here?

It feels awkward to leak AER-specific details into pcie_do_recovery().
That function is supposed to implement the flow described in
Documentation/PCI/pci-error-recovery.rst in a platform-agnostic way
so that powerpc (EEH) and s390 could conceivably take advantage of it.

Can you find a way to avoid this, e.g. report errors after
pcie_do_recovery() has concluded?

I'm also worried that errors are reported *during* recovery.
I imagine this looks confusing to a user.  The logged messages
should make it clear that these are errors that occurred *earlier*
and are reported belatedly.

Thanks,

Lukas


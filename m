Return-Path: <linuxppc-dev+bounces-13062-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1616CBF1DB9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Oct 2025 16:32:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqyYf5dXCz304h;
	Tue, 21 Oct 2025 01:32:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:1000::53df:5f64:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760970726;
	cv=none; b=BWj+gWB0e1whhYJjk9/XNngEpxv2i/ufGuDOvdQlDl/h6g0aBCUR5nFeC4PClwkSYW3E8lrdVGW/oNBSndjvMGpifN6ckVuvRjY/3JTe7ZoHf0gXDDiV8mZseM/B82WFFRkVih5B/Io11tSjVg+xBkvOXdOcQL+lWWhbruara2FQv3SPcyafAYLYV0U+3Iyg/zuTS48yElICGZMkLTPAwhXmiXz9XrX0XJEyGgBLLxSsCbamOvhMr9fx0c1tw3rVtKB44erpsbztTaLXApwYuciffpqJzXZUoY2W6qbTcP89yT4YiAZgzQkin7p7fn/Fl/kCnCiBqdfZ07D8BbNFTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760970726; c=relaxed/relaxed;
	bh=jN8epKOfoLp2IS1NGmXBX0UbReJHlrKvusyKG5o+fbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3CUoPGdUtzod3u/+Q5wmZgWUgXOYKhln56yNrRhZwptvdmFutUHvolP7RT1G5aMbfraABm0A5/ECHD77iLCQntE9BMw3C59DQmeZ3OhTFKSqTSRdZIDDNplGmMrgSMg1nyJsZHkBtNo4xY8kABvimumH2KitBdpgTNlTy7uZv7oaE1kSk9Go/9maLDdAmqT4Bf6W1u/TeWKgyO8lNI8FwXRUkuUjdSONZsjW9+wUr+1j+5w3ZmgPPAqx0AnLGBOTF3kohkGZbpHgjrKUnOMciFa7XH/KjowxGPqosMODKbxH0nK0vFZYce6JMUeNT4G/igXjRodLCzxZxY+fhyzAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout1.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout1.hostsharing.net (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 424 seconds by postgrey-1.37 at boromir; Tue, 21 Oct 2025 01:32:05 AEDT
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5f64:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cqyYd5mYdz2yrm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 01:32:05 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 783182C0664D;
	Mon, 20 Oct 2025 16:24:52 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 6146D4A12; Mon, 20 Oct 2025 16:24:52 +0200 (CEST)
Date: Mon, 20 Oct 2025 16:24:52 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com,
	kbusch@kernel.org, sathyanarayanan.kuppuswamy@linux.intel.com,
	mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
	terry.bowman@amd.com, tianruidong@linux.alibaba.com
Subject: Re: [PATCH v6 3/5] PCI/AER: Report fatal errors of RCiEP and EP if
 link recoverd
Message-ID: <aPZGNP79kJO74W4J@wunner.de>
References: <20251015024159.56414-1-xueshuai@linux.alibaba.com>
 <20251015024159.56414-4-xueshuai@linux.alibaba.com>
 <aPYKe1UKKkR7qrt1@wunner.de>
 <6d7143a3-196f-49f8-8e71-a5abc81ae84b@linux.alibaba.com>
 <aPY--DJnNam9ejpT@wunner.de>
 <43390d36-147f-482c-b31a-d02c2624061f@linux.alibaba.com>
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
In-Reply-To: <43390d36-147f-482c-b31a-d02c2624061f@linux.alibaba.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Oct 20, 2025 at 10:17:10PM +0800, Shuai Xue wrote:
> void aer_report_frozen_error(struct pci_dev *dev)
> {
>     struct aer_err_info info;
> 
>     if (dev->pci_type != PCI_EXP_TYPE_ENDPOINT &&
>         dev->pci_type != PCI_EXP_TYPE_RC_END)
>         return;
> 
>     aer_info_init(&info);
>     aer_add_error_device(&info, dev);
>     info.severity = AER_FATAL;
>     if (aer_get_device_error_info(&info, 0, true))
>         aer_print_error(&info, 0);
> 
>     /* pci_dev_put() pairs with pci_dev_get() in aer_add_error_device() */
>     pci_dev_put(dev);
> }

Much better.  Again, I think you don't need to rename add_error_device()
and then the code comment even fits on the same line:

	pci_dev_put(dev);  /* pairs with pci_dev_get() in add_error_device() */

> > >    .slot_reset()
> > >      => pci_restore_state()
> > >        => pci_aer_clear_status()
> > 
> > This was added in 2015 by b07461a8e45b.  The commit claims that
> > the errors are stale and can be ignored.  It turns out they cannot.
> > 
> > So maybe pci_restore_state() should print information about the
> > errors before clearing them?
> 
> While that could work, we would lose the error severity information at

Wait, we've got that saved in pci_cap_saved_state, so we could restore
the severity register, report leftover errors, then clear those errors?

Thanks,

Lukas


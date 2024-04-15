Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF258A57C3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 18:30:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJCLv6pZJz3vcZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 02:29:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=perches.com (client-ip=216.40.44.10; helo=relay.hostedemail.com; envelope-from=joe@perches.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 564 seconds by postgrey-1.37 at boromir; Tue, 16 Apr 2024 02:29:35 AEST
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJCLR6gJ1z2xYY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 02:29:34 +1000 (AEST)
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id ECEA4A060C;
	Mon, 15 Apr 2024 16:20:02 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf12.hostedemail.com (Postfix) with ESMTPA id 25AC719;
	Mon, 15 Apr 2024 16:20:00 +0000 (UTC)
Message-ID: <03f357e6c16d13924b705513446e4eac37e38a99.camel@perches.com>
Subject: Re: [PATCH] PCI/AER: Print error message as per the TODO
From: Joe Perches <joe@perches.com>
To: Abhinav Jain <jain.abhinav177@gmail.com>, mahesh@linux.ibm.com, 
	oohall@gmail.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 15 Apr 2024 09:19:59 -0700
In-Reply-To: <20240415161055.8316-1-jain.abhinav177@gmail.com>
References: <20240415161055.8316-1-jain.abhinav177@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 25AC719
X-Spam-Status: No, score=-1.19
X-Stat-Signature: 77e1p4uka3bqt7e7ii1uor3ehdgef6hp
X-Rspamd-Server: rspamout05
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+mInIM+0CNX9KiE6s0STSXDV9arJlA+oo=
X-HE-Tag: 1713198000-709223
X-HE-Meta: U2FsdGVkX18fRK6pvB4sqjrD+Hoi7VifTu0b/kmK1fLRq+6B3315wuHjJaVxwsG3ryHMye27wG92hwxaE84zKznFV1zdpaNmTJ2xB8DEbZshNqhjvOu22m9mjY8RFR1Hka4ZE9kfGrep6llNfaDZ9WmRCRfYMRWqkhV3SuYQsPxaG+BJVarT1Q4Du+CM6d08EhHIODww0VeyqdEAvD4KUqWuL47rgeAgHsM15SJy/OWPpDQS+3/c45vgN9oMm8wPJ87a9a82vl2KAfLVrGD/kgMIuNwILrYGNmJ6/e7U5TwlI43oa3xcOPtGoMKVLmhX
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
Cc: javier.carrasco.cruz@gmail.com, skhan@linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2024-04-15 at 16:10 +0000, Abhinav Jain wrote:
> Add a pr_err() to print the add device error in find_device_iter()
[]
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
[]
> @@ -885,7 +885,8 @@ static int find_device_iter(struct pci_dev *dev, void=
 *data)
>  		/* List this device */
>  		if (add_error_device(e_info, dev)) {
>  			/* We cannot handle more... Stop iteration */
> -			/* TODO: Should print error message here? */
> +			pr_err("find_device_iter: Cannot handle more devices.
> +					Stopping iteration");

You are adding unnecessary whitespace after the period.
String concatenation keeps _all_ the whitespace.

The format is fine on a single line too.

Something like:

		pr_notice("%s: Cannot handle more devices - iteration stopped\n",
			  __func__);


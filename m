Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE20592BBD8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 15:50:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=WkltUh1i;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJMnd6T1bz3cTQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 23:50:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=WkltUh1i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJMmw0Vs5z2xPd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2024 23:49:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1720532947; x=1721137747; i=markus.elfring@web.de;
	bh=a015ZC5r03ehNw73sIJe/WiI2A13WN9tv5vZoYkZ0RU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=WkltUh1iEhfoZNCT8KIZzUNg0zksVJFjJ//b7xvaMKPZYWZzqaql+V44Zp7pOk5I
	 2QZqvsbiNHMN9zmFympsFgqukqxmprSUZk2LSLxIJNzsZU9jWLefhYUyn9ppEUNTM
	 nvJmckHQmcuwW13RKU7MUWzx7rdnzu7pdcjOGKxFXtCkHC3Zl8geeA9jqnQjawtpZ
	 i4iCh67n2gH7f8kPpMXd3vbELVHT5EHgYgmqSXdullP+YqkB2uopSLdPi7Ekkqa03
	 cux55NxZK0qaSInTsYavVTpxt57EAFMFB9cVdI8l+DZ2sNmPLKtZhOlyAgvavZj4R
	 ykjxJpkJIoVN0ZwzLQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MOm0r-1skBlk0bNv-00Lgme; Tue, 09
 Jul 2024 15:49:07 +0200
Message-ID: <a10b0d71-2e1c-47d6-9c7a-4086035fc6ec@web.de>
Date: Tue, 9 Jul 2024 15:48:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: make24@iscas.ac.cn, linuxppc-dev@lists.ozlabs.org,
 kernel-janitors@vger.kernel.org
References: <20240709131754.855144-1-make24@iscas.ac.cn>
Subject: Re: [PATCH] cxl: Fix possible null pointer dereference in
 read_handle()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240709131754.855144-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wD8tpFNoCW581VFsOPGKJF66fFjx15l+bwepghLJM6uHTOaEEIV
 S+CYjNw6rH2wZ4TwvNgnSQP8vBlD/7iuiRLjicS9hxBOLD8V1kU2vdnDrofiv4uP6k9Fh63
 tqjoNqMkBduPCI8cZMTSYsHsjI2ttQfQTSuaquQ1HtekCs1jJFF+FNrDUy0EF/ZT3bBSY5l
 XIyBXWpEoWS9T6Vfr42qw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MqjwUJAwWmA=;d33iWjaAIjULA24pEscPLGP8YoJ
 nnxs35QjcOFAwZUZOS/fchXGW2rVCJTqaBwzJC3otBl2Nku7qfiw0wV6Xvlf8W+rr2JpjG7oW
 Ax0SjwWa5i85kIiemtwn+/qUrpNio9Wltl1QXbrFRSLOgFmTW+6m3RT25od+kA4JTuGJJrhE1
 +V72jE+WfgmWe8buVOkeJQzlA6witivjXSsni+spk7rD9X2QkMB2uQe9oEyW4pT48zsAEkpLT
 l+n7kL9Ju8MPN/aPKOaeD2naiXWuTVVbdJomjnS45Eyu+dT1hi1zyLwBO0+FeiP/uwGOe/v3W
 WdnK72SAHW1OcK0pfs9EpWk/OBk6rUSXDzH9lG3ADFodCCmeRHNm6pxyAVdvtUz827ZOahdCd
 T47sLWT3wNR19SCzdd6PrLkFWJQpmfgmBRkj16Zam7hl1JacP2KwMmFZKgz0FFvEVauFWB524
 HMqyJobNi4lnigHkg7pJ+VZxtMpdAPI9i3gsivCR+VGYueYpbjQq2N1Gz3gWSkj6OUp+dkV9v
 KOL6OHmzv2b/ntdMOaxRMo7DyqK+rvZku2hJgxYXpNlqsb86S3qfaeTpms4gnW7NpfFoFvEoB
 pP1MAyVx1cegla6iWuJpFte1lg1SLidWLzXp8u7tfK1bpfk66Xohy9JZNjScdTsGERdqiG5KT
 cbBUs/wiXNzkl9AbNVsJxDBF2sGWkEqxlstxPnpdxGZFKrZRE11RZ73T5vYSbzDFffSLHq5kQ
 BZi2xY6kJksgnRBYPyzNtbDHWj6BdSWycz1xAFr6ShVATEdztfpHEhAkODEpsA+atYGhMG5Ol
 ux7Myq0mUUuINiM7gvwKns6m8TXTYbqM4bfj1DdUbAxWY=
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
Cc: Wei Liu <wei.liu@kernel.org>, Christophe Lombard <clombard@linux.vnet.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, "Manoj N. Kumar" <manoj@linux.ibm.com>, Ian Munsie <imunsie@au1.ibm.com>, Frederic Barrat <fbarrat@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

=E2=80=A6
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>

Under which circumstances will this information be corrected anyhow?

The usage of mailing list addresses is probably undesirable for
the Developer's Certificate of Origin, isn't it?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.10-rc7#n398

Regards,
Markus

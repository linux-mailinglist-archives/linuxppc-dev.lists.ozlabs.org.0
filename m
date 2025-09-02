Return-Path: <linuxppc-dev+bounces-11611-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CFFB3FC7B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Sep 2025 12:30:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGMTF33TSz2yN1;
	Tue,  2 Sep 2025 20:30:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.3
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756809041;
	cv=none; b=La0a7mgdhv6f/0aMjLoDP8G1q42fUS0JPdF/1Jn7GMk5lOBNVnGq/mtgzis/PqbjkJZ6Pj02C7x5VGxjAwqWyGTCeLn86uIA85v++S4rq5bumUPRe8pGx1l/U6is8MwUie84YIvzRq5FGBl23haP0WynJFhXRN0zil3dzIb9eLp0pbaEFGdbBPlG8zk9NaTfgsdFpNy44Czl+arLy7jDJI/b55RzSOblD6QjX3y7Q22qwbN3gSzrjeAKFM45o6wq1vbjnIIITnRbc+ycrnH3FQQ9AfEGI9Zx3/NTo27trKOquLr7BIiP4tseitH0U59yhYnP0Qky/ONxD1SjY3M5Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756809041; c=relaxed/relaxed;
	bh=cjJrnkDnFnzLDq07yvkm48ap++PaOM5ISCnzNbnsPRY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=dKKpxlVGzt+KWAJFpwbWWuK1iGnOXlQ/mY0QX0hJSs5OAG7G0mnD5teALjwwm4fJFrozMiAZsFRGcwFuvz9W2l9e3xz9UlWKi2vIdCoSif3QZGiTCkRKdXr1H2fe/cy9CUXkoPpn4JW168U6Yd9vkmIORKDfJZa1+HUO+1tQ0uhx/pG2NcdKxJN/OnwLeMwev5xB9jjDL+rfs50tEZZ1UdGBXPm3/at6YDuhTvrRWba9nToKz7xJb4Ne4GBG01uPxGPGxFAsoJ1+4keRNtFr2GiALsE9O2mEI5h6CKOWQ5KL7+SdFytZCoX6iGDmNd0enhUa8pItbotEnosKbczYsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=cJEUoTtt; dkim-atps=neutral; spf=pass (client-ip=212.227.15.3; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=cJEUoTtt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.3; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 363 seconds by postgrey-1.37 at boromir; Tue, 02 Sep 2025 20:30:38 AEST
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGMTB4ltdz2xQ1
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 20:30:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1756809026; x=1757413826; i=markus.elfring@web.de;
	bh=cjJrnkDnFnzLDq07yvkm48ap++PaOM5ISCnzNbnsPRY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=cJEUoTttj9SvIPN/ihIt+zSn/ViWgbDt52nwuZLkoxJ8YoTy4z0I9kSGoPJ1cljK
	 8fXqSAPLOpcpoF6E+sHkRgKsdj0eCE/HZRB4UFb9qEmtVM4jRb08URl946qVZmmVs
	 Awt0AfAmOJM0L+5EFl5/JuIdHSglGPljXNDWg6oWXdUvrv7BcPf90aJJvwRo35sml
	 mRPOhoVmC02IEnuK4F6Vnc1ixydB13sczN5k3i7BtwyUXzu02kKGDO3oVR3YR40wN
	 QH5pnDIdT1RkRwiTZAhFbNjHJmYKh21nwt2P3OidG7LLxPQhhoTeWFkKPOmPyZQ/h
	 hwWI4YqGhHStUNT4uQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.184]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MRk4s-1v3oZA0gW2-00Roqf; Tue, 02
 Sep 2025 12:24:14 +0200
Message-ID: <63be79a4-79e4-47f5-a756-aa55fe0d29ab@web.de>
Date: Tue, 2 Sep 2025 12:24:11 +0200
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
User-Agent: Mozilla Thunderbird
To: Miaoqian Lin <linmq006@gmail.com>, linuxppc-dev@lists.ozlabs.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jiri Slaby <jirislaby@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Olof Johansson <olof@lixom.net>,
 Paul Mackerras <paulus@ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>
References: <20250902072156.2389727-1-linmq006@gmail.com>
Subject: Re: [PATCH] pasemi: fix PCI device reference leaks in
 pas_setup_mce_regs
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250902072156.2389727-1-linmq006@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LEf6BUZ69GRHnmo0O2buQynr9kYKhuNh5K8eqeJY7X82uuO2Qqf
 5hq/Fq8jQ28bVPFR482bOpqIVsrWey9UIOw1a4TDAv+1oId1UV98ADFoOTo+jldZVBZzqDF
 JktM38rq+o9Xle/9EN/5RxIMFCRDq47/edtb4tgqaJQQ0mwSfarLvNihLinUG77nRFfBbUx
 nbh99d9cHzKL/2wtROBzA==
UI-OutboundReport: notjunk:1;M01:P0:lmjRddonsQo=;2dsAS6vQ6Nz/DCNw/E/WWggmXFS
 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
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

=E2=80=A6
> Add missing pci_dev_put() calls to ensure all device references
> are properly released.

* See also:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.17-rc4#n658

* Would you like to increase the application of scope-based resource manag=
ement?
  https://elixir.bootlin.com/linux/v6.17-rc4/source/include/linux/device.h=
#L1180

* How do you think about to append parentheses to the function name
  in the summary phrase?


Regards,
Markus


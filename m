Return-Path: <linuxppc-dev+bounces-15550-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 454E9D14938
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 18:54:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqg4W6cXyz2xKh;
	Tue, 13 Jan 2026 04:54:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768240475;
	cv=none; b=UwVDqzJ8xIcqFjgFTZqhuBav6FUEXE7R5eEDopVAdUNpINpooov60C6I0Ud110danZ3CNNI0ZVmH1LU9jTZPzr2FKSKrsc3K+qRylT5/1z/e+li5mOsq5MtSDKGv9lZSuN4b+MMD+cBhmTvlItzHwDMBDYOaUWsYjo4AmDbAUL57/WgDduyzGGl5iFx15pbwOihUHEgqzZLMlv5fro1KL9EQvHJBO1Ph+zIrpeZHE+2RdcweBA1ZrZEV3Yz5aA/QCTrNgeXOA2nsOaEunILQ9J1SO0orIc3GT+g6TllqrkjpErJ90d41ztLmqAmKq9XPHjS6C92a556VM+4W6S0zgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768240475; c=relaxed/relaxed;
	bh=y6BPssvuqQ/qH26ZtP7OKYRtO9FGOS74oztLC07SRNg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LTr/b95ZXpTi2+sD1knibOhIA6944OLZ872AhuCYwKuvZiD1RDleyRet5duUlTh1hi2TluRQ7aKmO7diDpqjfe/LweaND3fJevfmqv1groskzer6C9Org2y/IXYr2+Yw20Si2O3AOYSmUkKwlwcdA2xNWh+JxcFnRrKKbqhbTAAytEmVU8Shd8UvapZPyOcmB4scE/i8c4uLeeVu1ti4K1DlspbJiddwJqjy4cLeh9XzTgTLuLWt+qefoS+fKkHbO8R6I6X5v9rwebP1usyXfy2dJ+0u/E8+It3dSKzfc2NmkaBfYDRMXWJTnMyaEsJENqyQn97wl3sRGWlMTxyRvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Nkolox6h; dkim-atps=neutral; spf=pass (client-ip=209.85.128.42; helo=mail-wm1-f42.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Nkolox6h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.128.42; helo=mail-wm1-f42.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqg4V2TXQz2xHP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 04:54:33 +1100 (AEDT)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47755de027eso38648605e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 09:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768240410; x=1768845210; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y6BPssvuqQ/qH26ZtP7OKYRtO9FGOS74oztLC07SRNg=;
        b=Nkolox6hDca7GdD5VpGu+2DgUgmpolDS59affBZfe/CdKH7zEhYIVGD0pn07+cwwne
         5c6V/kMOuEEdcfvrmtbCpJVYAGPQGJjeb5/gPx1yX0D7y56mT0sL3NESD1Kg/oYuWpat
         RBqiF4/Ar3S3AevY9BQ+rPt6FedbOEsbXa7Z6/JvJZSdrEXvkZ5bGa25g7sG1B1/yQOZ
         PObW/scDKkKq5kswTRt6DJ3vDEwTSgAOzZgz1DUY51goVoT/yoSUzEr3OEK1xOf5FuHo
         U5oxVTZzmy1Q4GtalaTTKrPg1twv1mqvdNq47il0golyCiCINovSsFbz8xOHq87fbjNc
         Nt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768240410; x=1768845210;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y6BPssvuqQ/qH26ZtP7OKYRtO9FGOS74oztLC07SRNg=;
        b=RgwM4rhYTtCPQzSQ6prbGMxVfQHR59SqWgCj9GqgDcl6fNf4Kh5X2AirlGh3ygLGjH
         1s0ZI73Pu3/wUMHmqKlYCzYj5i0tEjO9zt9iQZR+OzkkAtq5KtbB+zhlX5pXKcA6uyJL
         tE/nSxn9kpMWIwln7fceytdAGNxYVqYxjuwVSd6OVxEWZhYliksDPWJa8NrRjMXwJODy
         MFLLtLBT8lPnEgbPGFqRLR31ia0ulD7ao0dkmPL8qpCVosMfopYx63PACPz7pPNdZgxC
         egj4iwhFGt9vYW00L4Weph99J8KXr+uqskIwacumCHaeNHfCaA5+Ep1Le3bG7/zg5SbZ
         Y1fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIE12K+HJqNuAwNVbvt/v1J3QxVO9PsfqrAeH18hSfBGvlWhzPAcfUudLR128q2YmMLwYrHxrojAkXp7c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyXVr9tXwExWI2GhHOBTweCaDYQUtNX5ak7DC/f/Yal4yUgqX5j
	zRsbqzkhEyljYfrNpZOPcV8DAwB+0LOv3PVnG6olc1VKcRPYFVUAAK3Xzn84qSsMMr0=
X-Gm-Gg: AY/fxX7QdeQaCFlGiNfJzYbAYuXKGBz+MSmRcJn4yqKvLdeiQTsGMT4bGsjPgv53Rfm
	8BEESMqGTHKOIJEThJhxYCezSUbVlcFurLcFGbe/52p9AV6O59jrv0HgRScMkrHsLZ/iL0Lr72u
	N4JbkTEttB8c3LmdODAFM9eLZDxMATN1j4UuztxCp1qXnHBF5n1V9XSVVy4aXccZgD3z7Av0Qtt
	9zA1ANDs01577gnqDESYWt4ThHrVZHcKAmgpIzguVSucuA09E1v1t4i7hKeT0eBS8lRCMIXDvWo
	L4BCMFhr6xDPERXkm4CqoZTKnBh8UxaC3MV34s8lKb42oTa+usQ7Am3b7O4NjHd/QFtrpUlfpaX
	oHe253By5WA0FnlVUnO612HqkzKs4A+yfXcScRfxNr1F+Kn1E5FUaq5R2E6L+u1ojYiUoNDfS/8
	AXlPA0UPHBFiu1QmS17ctGSMfJhuK4/Dc7lbUTzVHwjg==
X-Google-Smtp-Source: AGHT+IGfCgsoYudB43gyY5VgiMyajRCyMKVvdA/K1TPc0FTW2J7Pqnzu3xNux2u9C7uenfxIM0LM/g==
X-Received: by 2002:a05:600c:4e8a:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-47d84b170famr247229235e9.10.1768240410449;
        Mon, 12 Jan 2026 09:53:30 -0800 (PST)
Received: from [192.168.3.33] (218.37.160.45.gramnet.com.br. [45.160.37.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f69e13bsm368953115e9.7.2026.01.12.09.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 09:53:30 -0800 (PST)
Message-ID: <0585581cd2f19544c5e1565a9d241697d812b5f9.camel@suse.com>
Subject: Re: [PATCH 00/19] printk cleanup - part 3
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Andreas Larsson <andreas@gaisler.com>, Richard Weinberger
 <richard@nod.at>,  Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes
 Berg <johannes@sipsolutions.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson	 <danielt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>, Petr Mladek	 <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, John Ogness	 <john.ogness@linutronix.de>, Sergey
 Senozhatsky <senozhatsky@chromium.org>,  Jiri Slaby <jirislaby@kernel.org>,
 Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook	
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"	
 <gpiccoli@igalia.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy	 <christophe.leroy@csgroup.eu>, Alexander Shishkin	
 <alexander.shishkin@linux.intel.com>, Maxime Coquelin	
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Jacky Huang <ychuang3@nuvoton.com>,
 Shan-Chun Hung <schung@nuvoton.com>, Laurentiu Tudor	
 <laurentiu.tudor@nxp.com>
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org, 
	netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Date: Mon, 12 Jan 2026 14:53:12 -0300
In-Reply-To: <836139d1-1425-4381-bb84-6c2654a4d239@gaisler.com>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
	 <836139d1-1425-4381-bb84-6c2654a4d239@gaisler.com>
Autocrypt: addr=mpdesouza@suse.com; prefer-encrypt=mutual;
 keydata=mDMEZ/0YqhYJKwYBBAHaRw8BAQdA4JZz0FED+JD5eKlhkNyjDrp6lAGmgR3LPTduPYGPT
 Km0Kk1hcmNvcyBQYXVsbyBkZSBTb3V6YSA8bXBkZXNvdXphQHN1c2UuY29tPoiTBBMWCgA7FiEE2g
 gC66iLbhUsCBoBemssEuRpLLUFAmf9GKoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 QemssEuRpLLWGxwD/S1I0bjp462FlKb81DikrOfWbeJ0FOJP44eRzmn20HmEBALBZIMrfIH2dJ5eM
 GO8seNG8sYiP6JfRjl7Hyqca6YsE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (by Flathub.org) 
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 2026-01-07 at 11:22 +0100, Andreas Larsson wrote:
> On 2025-12-27 13:16, Marcos Paulo de Souza wrote:
> > The parts 1 and 2 can be found here [1] and here[2].
> >=20
> > The changes proposed in this part 3 are mostly to clarify the usage
> > of
> > the interfaces for NBCON, and use the printk helpers more broadly.
> > Besides it, it also introduces a new way to register consoles
> > and drop thes the CON_ENABLED flag. It seems too much, but in
> > reality
> > the changes are not complex, and as the title says, it's basically
> > a
> > cleanup without changing the functional changes.
>=20
> Hi,
>=20
> Patches 7-17 all say "replacing the CON_ENABLE flag" in their
> descriptions, which should rather be "replacing the CON_ENABLED
> flag".

That's true, thanks for spotting!

>=20
> Cheers,
> Andreas


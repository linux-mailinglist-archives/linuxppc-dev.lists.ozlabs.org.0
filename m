Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1091CBE8F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 09:52:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Jztt0qGMzDqfM
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 17:52:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HbnKqXSy; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Jzs24jnYzDqKN
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 17:50:46 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id b6so1734943plz.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 09 May 2020 00:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=nxXi7zRXXXgVAAVfIysyZAoQ/hPNrGtQkkApXMNobYk=;
 b=HbnKqXSyN3EuR8wdhuqrojiUPYHLnF2Fpe3fLF2TAsCWKT+xX5IWnG7cKMBn04BbiN
 ZWUWHG4EkJaFlBXEN4L+wgHdc2WrgvpnqlIjavWTW+ItBjmMOA2AQ02QQKv2ZzOPun3I
 FKfjhlW0dLuIVNAB8BCRH+eGjRU6K99fAVBBJ7F3M/TE6hBz/DU/VF8iyGFWCq9GO7Iz
 vqiOg104phOsvaTgjcH7GXnBoJD/5gIWuZMx2cOBFH/7Gx0cmzg/xFfrVU/MV7fVGh3W
 Am9qAWrJUA3b1VYTOy5ANkvkXn/GjOOpwhSdcYKxGsoR7YjtWf2/L0Sqw5m+SOUYIoJP
 m2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=nxXi7zRXXXgVAAVfIysyZAoQ/hPNrGtQkkApXMNobYk=;
 b=eeFu3IYEhNlWBHvWpIZ8pGfPdg2AIa/OGZQnrZn8JNGCSO4YkeX1FVVJo0msSLQK1b
 a/+8LYyWAUoS1mFBk0FULD2UUokKCTIDV/8TMgz7HQu3ysvufubGnqeCoWnL6sb0383+
 tmZMjwsDmmjgZdeJHaOrRpkfMm+soXg2VoofZgLU77K3wP/l90iYjLnIAkS7PVcF7DZx
 3Wkm7KzBwnst9/1AC7hT89GHIDs4qz0mSZgfMSTDbFgZjU5a0cgAFoaSgwAHCQhw6abR
 q6mV/B42nS+04zJROVw9pg6+Uq+iAMWbIbvE26+cLl/cr4IZ5rdbC+3yUGHHcWOl3Dgo
 cOHQ==
X-Gm-Message-State: AGi0Puaj9PVx6Wpn/2BfpONfdPM4lZz43FGduTZjZ38ZwcpwHsTuRLmW
 DVQcNnDuTvT10F3FGfTqMNdwH5Hw
X-Google-Smtp-Source: APiQypKVWI+FVe0Id9lCFNqXjCQRUPi46nz5qtstXmA5pa4mG8mweoM5MQNRvj/up8AgWcpYiV+pXw==
X-Received: by 2002:a17:90a:6403:: with SMTP id
 g3mr9121920pjj.99.1589010642800; 
 Sat, 09 May 2020 00:50:42 -0700 (PDT)
Received: from localhost (61-68-214-199.tpgi.com.au. [61.68.214.199])
 by smtp.gmail.com with ESMTPSA id b75sm4095264pjc.23.2020.05.09.00.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 00:50:42 -0700 (PDT)
Date: Sat, 09 May 2020 17:50:36 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 11/16] powerpc/64s: machine check interrupt update NMI
 accounting
To: linuxppc-dev@lists.ozlabs.org, kbuild test robot <lkp@intel.com>
References: <20200508043408.886394-12-npiggin@gmail.com>
 <202005091105.sXZ24DNr%lkp@intel.com>
In-Reply-To: <202005091105.sXZ24DNr%lkp@intel.com>
MIME-Version: 1.0
Message-Id: <1589010505.dk8cddftjn.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from kbuild test robot's message of May 9, 2020 1:13 pm:
> Hi Nicholas,
>=20
> I love your patch! Yet something to improve:

...

>   1419	#if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
>   1420			pr_cont("DEAR: "REG" ESR: "REG" ", regs->dar, regs->dsisr);
>   1421	#else
>   1422			pr_cont("DAR: "REG" DSISR: %08lx ", regs->dar, regs->dsisr);
>   1423	#endif
>   1424	#ifdef CONFIG_PPC64
>> 1425		pr_cont("IRQMASK: %lx IN_NMI:%d IN_MCE:%d", regs->softe, (int)get_=
paca()->in_nmi, (int)get_paca()->in_mce);

Oh I meant to get rid of that hunk, it crept back in :(

mpe if you could please take it out if you're merging this.

It was quite useful for debugging this stuff, I might do a proper patch=20
for this, but for now not necessary (it doesn't matter for "normal"=20
crashes only crash crashes).

Thanks,
Nick

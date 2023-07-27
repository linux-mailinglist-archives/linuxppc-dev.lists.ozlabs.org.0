Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF49765FFC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 00:54:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=nN3rX9Pe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBmKx5jgQz3dK1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 08:54:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=nN3rX9Pe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c; helo=mail-qt1-x82c.google.com; envelope-from=carlojpisani@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBfFf5HYDz3c3C
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 04:20:21 +1000 (AEST)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-403a85eb723so8530901cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 11:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690482018; x=1691086818;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PcBP1XxjNmbI4nocR7IgV+AOIx8tJfQjnUff81XdeXk=;
        b=nN3rX9PeM3z5Li8BQr/G01V4nj85hbrj2n73xSjKhK5s5480GNJT7vaCzJ/++MgOYW
         a6gnqSMvtpnsOM/gZXsPQ6WpJ50rKhsKhVKqmsNi4h2arPgBTU4IrmB0tLx+vF0ZI/6+
         boPnAHh10uUZSFNy+QlGdndtIZyqu/rZNwzle7J/T5QYtw663pxZmEG3usep9uVYhEwa
         UweNkVIkzsBSp12dHlcG/8qUYuBh3oSjoKhJ/HzeRGcnfc3eoG6BnJ4WTfLHV+V690Ds
         021sTngeo673+xOmG78xmQ164OJFTKVR1vwVuatGhWz8L+/qAFAkqtQDdlcCl39aqhbn
         xfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690482018; x=1691086818;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PcBP1XxjNmbI4nocR7IgV+AOIx8tJfQjnUff81XdeXk=;
        b=Y5OVvd5p9VIJvWFv1n+9bIbiV21umyd7lMPcLfE/7O5ZzGQSEodSCHToPQXGCcKxsQ
         Kxdtpq6dvchobw9BSmZ9QW9ojSXOxwuva7DKnFGK1Zt7/cWFCtVqp1Z4BboAFNJxEx8M
         kNwxOnH+/DjWv6D8DA+P9snG7PIgbIaH3jbOxOO2u5LDMGlshqWwjCD1jhkUZESp78+G
         cQqrMVVhd4razsL0E3DniEtu5x3sc+zt0OBw6I0TR8A6f/x+syd59yfcOg/JJ8q5GbEM
         IoFUZe7ljH8DEg1sFl9O5Zp2cAVLq9SHRKwIYJyuvWAEzovIey6NZMTmnvMncbP2OCa/
         2VDg==
X-Gm-Message-State: ABy/qLZeIG0JrQOmHw4NQ9Mqu5g5gF13XAZ+G/Sp+bFNPWzAOUMOSz2I
	e/ZjnYdQytqJsbd5Hay4y+Czs1QMl2YZubDJpiE=
X-Google-Smtp-Source: APBJJlFPl2lF0jRo19iFxLEDUyQa77ORbE9AUEy7bgjgr6d9GCXOOYgckvuCBn6snl2msBeG/jmI+TISKxYvF1QLF2I=
X-Received: by 2002:ac8:5996:0:b0:403:cffa:e79d with SMTP id
 e22-20020ac85996000000b00403cffae79dmr407017qte.12.1690482018256; Thu, 27 Jul
 2023 11:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230707095415.1449376-1-arnd@kernel.org> <20230707095415.1449376-2-arnd@kernel.org>
 <ZKluqG2ZqKtAmnEG@alpha.franken.de>
In-Reply-To: <ZKluqG2ZqKtAmnEG@alpha.franken.de>
From: cp <carlojpisani@gmail.com>
Date: Thu, 27 Jul 2023 20:20:06 +0200
Message-ID: <CA+QBN9C8ZfQa1dtGSh-pmywnKaGETZA+N-3T78R2b8mpYN0fgQ@mail.gmail.com>
Subject: Algorithmic P-4000i, looking for the board manual
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: multipart/alternative; boundary="000000000000328b0f06017c047a"
X-Mailman-Approved-At: Fri, 28 Jul 2023 08:48:48 +1000
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
Cc: linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>, linux-riscv@lists.infradead.org, WANG Xuerui <kernel@xen0n.name>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, javierm@redhat.com, Ard Biesheuvel <ardb@kernel.org>, Matt Turner <mattst88@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Arnd Bergmann <arnd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Zimmermann <tzimmermann@suse.de>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000328b0f06017c047a
Content-Type: text/plain; charset="UTF-8"

hi guys
I am looking for board manual of the old Algorithmic P-4000i.
the purpose is to restore an old board for educational.

Does anyone happen to have the manual or info on the board?
let me know

C.

--000000000000328b0f06017c047a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">hi guys<div>I am looking for board manual of the old=C2=A0=
<span style=3D"color:rgb(52,73,94);font-family:sans-serif;font-size:16px">A=
lgorithmic P-4000i.</span></div><div><span style=3D"color:rgb(52,73,94);fon=
t-family:sans-serif;font-size:16px">the purpose is to restore an old board =
for=C2=A0</span><span style=3D"color:rgb(52,73,94);font-family:sans-serif;f=
ont-size:16px">educational.</span></div><div><span style=3D"color:rgb(52,73=
,94);font-family:sans-serif;font-size:16px"><br></span></div><div>Does anyo=
ne happen to have the manual or info on the board?<span style=3D"color:rgb(=
52,73,94);font-family:sans-serif;font-size:16px"><br></span></div><div>let =
me know</div><div><br></div><div>C.</div></div>

--000000000000328b0f06017c047a--

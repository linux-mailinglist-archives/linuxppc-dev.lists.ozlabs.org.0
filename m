Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 114EF4646F9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 07:01:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3pPj1d3jz3cPD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 17:01:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EMHBw0e/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EMHBw0e/; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3pP14TmRz2yP9
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Dec 2021 17:01:07 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id
 fv9-20020a17090b0e8900b001a6a5ab1392so459311pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 22:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=p+h1Ci/5eM23w48d10JZjE3E1+seAEm4EAViYXAETPQ=;
 b=EMHBw0e/vGvcPCdRzYL0MfE/37rgfduTDk9qLZ0R3VsAFToDzsY/A2ZyZ55i+ws7OC
 0NL1oAJDxinVH4PZ9cqcxaQji1byUi4VBBM5seBz+tqYgz/yhelWO7a1trjSCybQ3lcc
 pYciQPv0k6n7Hwx2dgGPY2QSQxnkTHGPCPmxujPrXi76r1YIneRk3+Dos1ye+XfYOd2i
 VvBSarZjbLT9XBYH2mkWnOmV0bD/AoTKSuoMmLv+z7Tqnq4tqUwJ+nlHapIl9iQR9Sfq
 cQMSM+DZl4T0/eKs/Idrs599QBFIKXg03quXFFHV1VsZovNYt23a2gDS0ak+hDJvHwwB
 28QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=p+h1Ci/5eM23w48d10JZjE3E1+seAEm4EAViYXAETPQ=;
 b=yBGsIXaxJa2MbDpiGDRjPeawD9PaJuyDUSaC73eb0zYkAZY4qLKhixDFAeoZf1TSk9
 qBYlSOiPeKry8P6ud0BcRwHCAAUGmMJk2DZXUdzm54+YTTeZkF0Vzpiv5UJ28zlnLXMt
 it5ktwrWl219KcnQ5Yu3xXyNXRM27RGcDPfZBFiak2g1uvPRP93pkfzhIKQuTkuZcCsx
 jW/2Q8y0R20zMaDuKo7/fP1TZ6nvC4PJnw5fnSl9MO0K9lWSO2WWJsVfS1xWdgxy0MW+
 lxcTV0szLfaJVAKdXTjKa0VPRxB+G17ABS3oiOMfCyqJdDOonosxCIa1uaFMzTDtOI7J
 t8VA==
X-Gm-Message-State: AOAM532UrLG8n34nnKFpshLiGvUMQ3ioTlu+l9M/QnqPkXI+rpVAOny7
 srsnYOWAReKOfDKI2ZM5kGE=
X-Google-Smtp-Source: ABdhPJyVjW0vwT2dzIxQQRiiYKpz/cJyyLjekGgJiHEOZGOEmsuBfOcYzGxu/rMy5VtmahhvpyRyHA==
X-Received: by 2002:a17:902:c202:b0:142:2441:aa25 with SMTP id
 2-20020a170902c20200b001422441aa25mr4897937pll.68.1638338464453; 
 Tue, 30 Nov 2021 22:01:04 -0800 (PST)
Received: from localhost (115-64-213-93.static.tpgi.com.au. [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id p10sm22499478pff.173.2021.11.30.22.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 22:01:03 -0800 (PST)
Date: Wed, 01 Dec 2021 16:00:58 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 rebased 5/9] powerpc/mm: Call
 radix__arch_get_unmapped_area() from arch_get_unmapped_area()
To: alex@ghiti.fr, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman
 <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <cover.1637862579.git.christophe.leroy@csgroup.eu>
 <6ba86b0ef347c04a6c4e475c059f486b0db170ec.1637862579.git.christophe.leroy@csgroup.eu>
In-Reply-To: <6ba86b0ef347c04a6c4e475c059f486b0db170ec.1637862579.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1638338152.00yryi8b39.astroid@bobo.none>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of November 26, 2021 3:52 am:
> Instead of setting mm->get_unmapped_area() to either
> arch_get_unmapped_area() or radix__arch_get_unmapped_area(),
> always set it to arch_get_unmapped_area() and call
> radix__arch_get_unmapped_area() from there when radix is enabled.
>=20
> To keep radix__arch_get_unmapped_area() static, move it to slice.c
>=20
> Do the same with radix__arch_get_unmapped_area_topdown()

Same comment with this one really. It would be better if we can
reuse generic code.

Thanks,
Nick

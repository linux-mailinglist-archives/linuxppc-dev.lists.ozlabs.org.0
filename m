Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E85EE319603
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 23:49:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcBdX1tptzDwrN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 09:49:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AsANI1TK; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcBc821flzDwnc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 09:48:05 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id j12so4622195pfj.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 14:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=WGBp0ms4trj4KJqYXx6s0gKRNvvrRpdSE+7mGZ4gKjo=;
 b=AsANI1TKW9wcXEIi4LEtOUxUNpQayajFoWP7YZ95m7XCh841Ai93sD6PPWxOs1HrCU
 KLifIGaiusRJ0RLzwKYHEWn7VejMLbo/L/UfSmjd8wD46Df0unMC3iqI/MyxpoW4tA7a
 5gPgoIkiyPiYDV1VkPTE+PliqL6iNwUwXcX8UrswcQ09T+gpIyB6rqYoLNPnfTO2EVw7
 H0xNJpzLjUU1UplPqkM3wz68SsvW4ICrfnA6OHJnQYUn2nvsmywbAN1+gGrDa3YeoSd1
 bRnNdhxaZWgAEbdWgRE/Ag2lrv76CA99xEAVfwXibiYJRkH8GzPgxqR7vvd7TAF0JkZV
 29IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=WGBp0ms4trj4KJqYXx6s0gKRNvvrRpdSE+7mGZ4gKjo=;
 b=YqpQ66xSHi/1v97IPlYy4f5G9CEOj2yOPIWMMIecpc8K1EtHNxIkqmp7Xax3y2XJMR
 vshfgOwZMn6iG2nvb5KSo/0RAkWkJiWJDYU1C+la7hWKXbITLljeqxTgxN13RIItQ80I
 MXiZ79eSC/U2QYgHwAZ45cOFtyv79fgxB+1VV3m1WVyskqY3iLP6umU+gZrIveQlip2N
 RiwjsH9uHF/Q5DW2I7rhoOyKh+zhYAeY38LXxMdb18b4nFEYILy0Pnq/avLOzjsGVflW
 bFfnFOvuyIO7vcJDxVCbc4E8Nct7gWq71nBmzT+W7vylnxqG13gWMscDHfsFkGfBQGt3
 hhpw==
X-Gm-Message-State: AOAM5304K1gTTfEHvUIoNcmrs6a1Xt5EU26acOailVVkHE9lO8ZlWulq
 VjxCi3f40YB1VdsBF3vrRlg=
X-Google-Smtp-Source: ABdhPJwvz8NkBzT3VZIsgga9RgZijGc00zoDlZLVlsIEeO9JeUJdtdmHJB4GLs8GlIbfIgvcvJeHKg==
X-Received: by 2002:a62:18c8:0:b029:1d9:6e93:6b22 with SMTP id
 191-20020a6218c80000b02901d96e936b22mr339226pfy.28.1613083682147; 
 Thu, 11 Feb 2021 14:48:02 -0800 (PST)
Received: from localhost (14-201-150-91.tpgi.com.au. [14.201.150.91])
 by smtp.gmail.com with ESMTPSA id j9sm6369183pfh.52.2021.02.11.14.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 14:48:01 -0800 (PST)
Date: Fri, 12 Feb 2021 08:47:55 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/bug: Remove specific powerpc BUG_ON()
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <694c7195c81d1bcc781b3c14f452886683d6c524.1613029237.git.christophe.leroy@csgroup.eu>
 <1613036567.zvyupcz926.astroid@bobo.none>
 <20210211115059.GB28121@gate.crashing.org>
In-Reply-To: <20210211115059.GB28121@gate.crashing.org>
MIME-Version: 1.0
Message-Id: <1613083544.ggx0xcefkc.astroid@bobo.none>
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Segher Boessenkool's message of February 11, 2021 9:50 pm:
> On Thu, Feb 11, 2021 at 08:04:55PM +1000, Nicholas Piggin wrote:
>> It would be nice if we could have a __builtin_trap_if that gcc would use=
=20
>> conditional traps with, (and which never assumes following code is=20
>> unreachable even for constant true, so we can use it with WARN and put=20
>> explicit unreachable for BUG).
>=20
> It automatically does that with just __builtin_trap, see my other mail :-=
)

If that is generated without branches (or at least with no more
branches than existing asm implementation), then it could be usable=20
without trashing CFAR.

Unfortunately I don't think we will be parsing the dwarf information
to get line numbers from it any time soon, so not a drop in replacement=20
but maybe one day someone would find a solution.

Thanks,
Nick

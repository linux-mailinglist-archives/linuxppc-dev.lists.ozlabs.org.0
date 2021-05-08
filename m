Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 935D0377102
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 11:44:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fcj893y1Hz3bww
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 19:44:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=srs0=9lys=kd=arndb.de=arnd@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fcj7q4NvNz2yYB
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 19:44:07 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by ozlabs.org (Postfix) with ESMTP id 4Fcj7p64ZPz9sWk
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 19:44:06 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4Fcj7p5gcKz9sWq; Sat,  8 May 2021 19:44:06 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4Fcj7n5m3cz9sWk
 for <linuxppc-dev@ozlabs.org>; Sat,  8 May 2021 19:44:05 +1000 (AEST)
Received: from mail-ot1-f43.google.com ([209.85.210.43]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mv3M8-1lNmeQ0HlQ-00r0oM for <linuxppc-dev@ozlabs.org>; Sat, 08 May 2021
 11:44:02 +0200
Received: by mail-ot1-f43.google.com with SMTP id
 f75-20020a9d03d10000b0290280def9ab76so10070129otf.12
 for <linuxppc-dev@ozlabs.org>; Sat, 08 May 2021 02:44:01 -0700 (PDT)
X-Gm-Message-State: AOAM530ntItPFVjLP3cDKoJXfnwpQyx9S4znCz3PfvV8llHUf9/bKd3e
 PYQkei7NvZnq3LdxnPe+HPBEaeuK/ecNvM15Gjw=
X-Google-Smtp-Source: ABdhPJxFhzsIrfow7fAwvlmtou6ORnBbWJqvpZmFoIdc6w6cb007BMdpaZFI2RWn6E04IjP/CX0zkM/keM8BWM23C60=
X-Received: by 2002:a9d:222a:: with SMTP id o39mr11660239ota.246.1620467040081; 
 Sat, 08 May 2021 02:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <be7c92b2-43c2-0d8a-6e8c-ac92e7e07bfc@csgroup.eu>
 <CAK8P3a3OdcSQQGKxRob3A6qfh8tVD1JtLdcTp9i25SizqWpiXA@mail.gmail.com>
 <19e791d9-3226-4c13-b6e8-cdabdaaa0268@csgroup.eu>
In-Reply-To: <19e791d9-3226-4c13-b6e8-cdabdaaa0268@csgroup.eu>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 8 May 2021 11:43:11 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3V=y8tHkN6JSpA54bKAOZv9RK04WcVE9LPL0r-WE0Nmw@mail.gmail.com>
Message-ID: <CAK8P3a3V=y8tHkN6JSpA54bKAOZv9RK04WcVE9LPL0r-WE0Nmw@mail.gmail.com>
Subject: Re: Kernel crosscompilers
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:axmyjZVJf7gLGA2V8ffbl5TBg30zHsxQT3xQChASYJeNrNWtBam
 /J/dtgHjRKvnPsUipoRGts1yed4iUGwd7VQQVSyv5X0yI9GWQFdk5TdwzVJ/XH+DoZE1GGw
 AmIjZANv6FlesuXx2vNWDAo/2iIuPWtiVG5QidkCd7daDgIdpgvSXchzZOSW65y0Thxih6U
 50y2Y3B1x/PGrO6ugHgYA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LNVnLSnnsec=:0OiC16H36INOLWymCgDe5o
 98rkjreHZILfpuZfgXVwUSALFcE2S3g8chq0FNivGhdZRvBoAIDVu14SJ2xZ7ENjf2wL7HZJl
 FsDDugketzfVxRP+S6DFYoORQrq6mxu2KK/6YZ8oM0e3lrqbwj7gvONjPen2tNXNo0Ker0a3V
 yznILVOpcbq5B6QM4SNvU0AjRyTL0MBf+cwBc5/pLTLCSMzZ9lmTuKMxCPI8E4tbtfILBPfjd
 0weUq25c5M0UKntB/s42XnK5fIHy1gCNe4dez6NrF3sPs5IhngT8BNOpys+v+PoSjfE1E6zXf
 bLTFM+AGbwjUWH14w8Nvt8AUZtZ2QQYks/RSVGj0nbwPeUIRdDf+sVv6drRO2dxmTcrY2GcCJ
 qwt4jSbE2EbHuWiqvT3hg0SX+g7JxkCA0phpu/yOKlQAr6jnrc3VHgKQ1mU55qv417K3YQF4c
 C8Y8bsy7Qn9Wg0y+7hfmkOobXuqZLmdlITlvQKSdP2QF8d0akwiGqv8bXlGHLMw/SlNZCeIiV
 nyj1g8nLkaOcVjFzDrAZkY=
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
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 8, 2021 at 8:46 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> Something is going wrong with asm goto output. I implemented get_user() helpers with asm goto this
> cycle (commit 5cd29b1fd3e8). I tested it with CLANG before submitting, it was working.

BTW, can you point me to those patches? I think it would be nice if we
could eventually
converge parts of get_user()/put_user() implementation on something
that works for all
architectures, we do seem to rewrite these way too often. Ideally we'd
have something
in asm-generic that provides all the wrappers, and just requires an
architecture to
implement the inline asm helpers for each of the sizes.

      Arnd

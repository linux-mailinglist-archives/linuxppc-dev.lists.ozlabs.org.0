Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F391754DB66
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 09:20:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNtr7692rz3cCP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 17:20:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.17.13; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNtqj4TS0z2yw3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jun 2022 17:20:32 +1000 (AEST)
Received: from mail-yw1-f180.google.com ([209.85.128.180]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N5FQJ-1ncXs112aj-011Cbr for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jun
 2022 09:20:28 +0200
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-30c2f288f13so5562147b3.7
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jun 2022 00:20:27 -0700 (PDT)
X-Gm-Message-State: AJIora8Jqz3l8uZixgjAW0eU/+R/NzvgsT3U8EhAaXQjln5FfMoqQfy3
	CYhBsoe0oU7CNL41LWUd27MxoQBuw1Woo3uNVik=
X-Google-Smtp-Source: AGRyM1uzs56/me9dlNvUy6VFokiB86fRaYGE6ZXvphzYcksIU8zayazDqcjmJ0XNpQ3Msv2ySBLHvhAVSHZioaO5MDM=
X-Received: by 2002:a81:5946:0:b0:317:71b6:ac46 with SMTP id
 n67-20020a815946000000b0031771b6ac46mr1357391ywb.249.1655364026665; Thu, 16
 Jun 2022 00:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220601054850.250287-1-rmclure@linux.ibm.com>
 <20220601054850.250287-2-rmclure@linux.ibm.com> <a722557b-533a-452d-3355-8f31052df4b4@csgroup.eu>
 <730437cb-62ee-0dfc-61b4-52458ab937bb@csgroup.eu> <8155704E-10E6-4AC0-817C-EB282848E0C2@linux.ibm.com>
In-Reply-To: <8155704E-10E6-4AC0-817C-EB282848E0C2@linux.ibm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 16 Jun 2022 09:20:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3JEn6zEbLjrSFgVjOreNevi4+tgJLqwf3-Gx7RfZWopw@mail.gmail.com>
Message-ID: <CAK8P3a3JEn6zEbLjrSFgVjOreNevi4+tgJLqwf3-Gx7RfZWopw@mail.gmail.com>
Subject: Re: [PATCH 2/6] powerpc: Provide syscall wrapper
To: Rohan McLure <rmclure@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:DI+Pdro/RXRkXgLiCrSd+5N3IjuecPhH+ztRr5XhBw2C0OP8buf
 oG9lsKlCJPKr1UGIDNitQS9i45vp79DyEkZXr4CKfN88lDAGejobwa8jguf/wD2UMijfRxS
 pA8/NgBui76d53K5+dq/qvPXvOmvxNu/8i8rpKOJx/35bVDFzQO9c2N+NhoPK4M3PP6orAI
 ixHTqWT0Gs+w/x7Rxf+RQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Kf3XjSWlELs=:UrViNt7u1TwiI4G1mgz/55
 G/D3JLxYxDp5fzteDz16mJZ2JnhqUXAX+BrSd1AMcDHlXmz7nK/bjaKEd9waROULDJvX7uulJ
 pHVEDGM7i1lXNzEQSvdveIRAZDnl2YpI7zR2WycLPO53TCXV9RO+6sd4BL82B383rqcLJ3qTD
 j4E4COCSS1foc5XtTNrhZjIyeSDLG+Foo0XhQUiNeAIlnY7i1J98UDYYpAfG4PcvBS+Uktr8l
 kghXB9VofF0OaycbHlCFjBSwYCvbckBmW5iZlVpz60stjcp0KDrVb1a1u6oOerDPjoVLxQYuI
 t3nmPHI9GdFzm+G+Z6mgP4KvK9NkDXQiWrqr+MwSGRep1yLcrKKtK31MrGI3S3sAkOTdo7ZvI
 NEsd5HvQ+71pq3nVnReMWtFx+ikXtRIpvKPzr1gzByeGDuePmiVUyaRCjPjg+VIq7wQQT96dy
 gIqmmOcQfceSe5yY8/pPldgm7OlvismBc0+s8h2XRxpmh+WhExN9+dCBmX5CrZYU0xOMpfftl
 pVlWmE9m1wYoD6+b+zFgKxsKygFjMfQyVxOBxTPVqBOCf/76bAIOfuWqgtOrgoUpqIx5kgumk
 rB4ldrAWVIJmvk9q9UvTt+7IKj19EH1J4mTSjLqG/gLHVx1M0AxNmlFuX58mFJmVulqKHt+aw
 MhzlfB0xUncM2CO0TvDTypwLfcSPnmT9QNGgJsPr/DQla2nlJhvR8d5drKaPfYma8Moc/NzAl
 VplqVC2DTmgim3nlmEkJg2HgBwn7OQlS5cWx10gAIg38BZ0T2dftXjBPhSOk+FbZYGAeEhL3W
 unaStveR/IvEIoyIwA7hiqFi/xlomrA7sks+Ma5cjvob5RU6cByn3ybkPeXsdA63OZlWN87Iv
 Pa/kqTfDQrJEFY6L/bqw==
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Andrew Donnellan <ajd@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 16, 2022 at 7:42 AM Rohan McLure <rmclure@linux.ibm.com> wrote:
>
> As for SPU's, the issue here is that include/linux/syscalls.h only
> provides prototypes for sys_... handlers. So spu_callbacks.c must
> reference these symbols for the translation unit to compile. A solution
> may be for spu_syscall_table to be made extern linkage and populated in
> the same manner as systbl.S. I suggest we simply omit support for sycall
> wrappers with the Cell processor.

The compat syscalls should all be declared in linux/compat.h.
I think in general the C based syscall tables are better because
they enforce the presence of a declaration for each syscall, and that
helps with type safety.

         Arnd

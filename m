Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA222559F26
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 19:09:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LV3W75RNrz3cgJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 03:09:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=217.72.192.74; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LV3Vh5CFVz306K
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 03:08:43 +1000 (AEST)
Received: from mail-yw1-f174.google.com ([209.85.128.174]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mi2Bb-1nQn8p15If-00e68A for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun
 2022 19:08:38 +0200
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-3177f4ce3e2so30953667b3.5
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 10:08:37 -0700 (PDT)
X-Gm-Message-State: AJIora94R3jl8lfOjhgF1X9ik91f505IlYOwpxPDn56zdqoRx3SqQonv
	+q6E60y7Z1+tZfHrVK5ffqC/hGscvygnLM7diW0=
X-Google-Smtp-Source: AGRyM1tBSdPwbFq9GZSjizWzVuAB7giujhHzzt55cTqkntbPy6yauQrkbaXTZ2eocC/Zbg06KphUioMdhsic93kqOWE=
X-Received: by 2002:a81:b93:0:b0:317:791f:3c0 with SMTP id 141-20020a810b93000000b00317791f03c0mr17394782ywl.42.1656090516599;
 Fri, 24 Jun 2022 10:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220624155226.2889613-1-arnd@kernel.org>
In-Reply-To: <20220624155226.2889613-1-arnd@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 24 Jun 2022 19:08:19 +0200
X-Gmail-Original-Message-ID: <CAK8P3a04C+ZavWb2nnYs-02CKZq10OA8rDE7QHMFF5qZzb6t9g@mail.gmail.com>
Message-ID: <CAK8P3a04C+ZavWb2nnYs-02CKZq10OA8rDE7QHMFF5qZzb6t9g@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] phase out CONFIG_VIRT_TO_BUS
To: linux-scsi <linux-scsi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:6J3Y6bC/IW30xCdiIuJaNFPq0jxY0cz57tmAMGR59BFZH09aTOk
 SSxF3PKHdUCpcUuHlq/mVjpHfgqkUOaio7O94AwPs5tav4N1n5WeO7FdZg46itWyqlMXqMO
 CB1eZzAiHPTPN3PvUqjjPI7fMUyJmSCPKfzVpyIDChsvqzbNxwAQJ1MRpMERqdegKCkGHoF
 doqPmH+dUUYNjVdjHf9mw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ryORQGv9bHg=:Rt3emcVUWQ1EhG3/xoWSPE
 63PrYcA1RrG3OI5dSL3fDnj2z7hwFW9Vyos83WA4OFACPXIJ9yWok9KZNHmoJ2lUy/HYMEkwB
 F2YqIGj7EXM8+GvikOlD22Wk/huhQM0LPt1VtI4RGvenZ2p9exmccYdphT4yu8FqVXWPExhzi
 VGp6NZTv9ITiZOkutTJxhWBg/dyl2KpCwNAyE2wWmP75MGJjpRrEAvIwgdAauPqGQbIRtoxXJ
 CwZzdYRF0KwJtdkcoMhGUUmWPduNN2gNAB7luJ8Y7krOsrot+oZTMBEOodDPXP56C+zIr9qv4
 undN8XxuuucLt6ENaS77RqQbJwLiyZwVx8hbneg21jwJlOorKhKgDFcmaSt/kvOHi1hiH6E+/
 zaObm0WcQZg1m8+QGt+mVzfXVQJ9Z/IfmeqjQheoCHFS6apCTmpBIv8pvl6WtfLgH5B4OtEKe
 9avlzHAcCEEmdWmi2Ymgu3Hv/0zx2WCphuisBoWbmNLvts6nggOBo6GzGybuJyBUmwHVF16J3
 ETWodNzL9Qgc9DaLsTdAoPa7tfj+fwsLpQbVvqnSKAd/DYWCI1ir+LbrX4LvUB5hTlxE3FOil
 R9v/70eVg6HfLEziKadLVEbYjOa/DInBfDAxJBLpg1etQDbJOW3TqHhkp4YZG7ldptsPRGkUC
 eVrdV4KjniSuwzGwX0E0BInq2du+qUw0IWkjIyVUSGTDjhRVVPzmyEKDDgwecMApnakTHGAlI
 c/yyeXG4luc0OQDyA/fG9wbbTFAcag+Cuz+fVQ==
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Miquel van Smoorenburg <mikevs@xs4all.net>, Parisc List <linux-parisc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Denis Efremov <efremov@linux.com>, Mark Salyzyn <salyzyn@android.com>, Christoph Hellwig <hch@infradead.org>, "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Matt Wang <wwentao@vmware.com>, alpha <linux-alpha@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, Khalid Aziz <khalid@gonehiking.org>, Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 24, 2022 at 5:52 PM Arnd Bergmann <arnd@kernel.org> wrote:

> Arnd Bergmann (3):
>   scsi: BusLogic remove bus_to_virt
>   scsi: dpt_i2o: remove obsolete driver

The dpt_i2o removal is overly large and got dropped by some of the
mailing lists,
if anyone wants to see the full patch, it did make it through to the linux-scsi
list at least:

https://lore.kernel.org/all/20220624155226.2889613-3-arnd@kernel.org/

         Arnd

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C34FC19995A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 17:14:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sCXR1QSlzDqyJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 02:13:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.135; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sCTF5wCDzDqc6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 02:11:11 +1100 (AEDT)
Received: from mail-qt1-f180.google.com ([209.85.160.180]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MV2Sk-1jkD642nVm-00SAQE for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar
 2020 17:11:06 +0200
Received: by mail-qt1-f180.google.com with SMTP id x16so18591212qts.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 08:11:05 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1NO7dEbvgIksmUN4k0on7yvG1PT7O4iJiiN7kDFe1wmvLBmkfv
 HNAGN8bxkhbTdTsw1dtvqB2gHdAIQuAFrAvgk9c=
X-Google-Smtp-Source: ADFU+vtZ2zLOYYG8mPGO4xtOd0Agn3IhRIKTv3VEKU5LkySIMsz/04fpbSZYf9ebnWdL3CYGkto3CcXF9ZJ8LJmGa44=
X-Received: by 2002:ac8:16b8:: with SMTP id r53mr5640923qtj.7.1585667464993;
 Tue, 31 Mar 2020 08:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <698e9a42a06eb856eef4501c3c0a182c034a5d8c.1585640941.git.christophe.leroy@c-s.fr>
 <38de0c6caceb052a23e039378dc491fe66cea371.1585640942.git.christophe.leroy@c-s.fr>
In-Reply-To: <38de0c6caceb052a23e039378dc491fe66cea371.1585640942.git.christophe.leroy@c-s.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 31 Mar 2020 17:10:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Q5gmcyjo03QoDMNO-xEWXDjhW8ScUsGGRWVKgVXj5_g@mail.gmail.com>
Message-ID: <CAK8P3a2Q5gmcyjo03QoDMNO-xEWXDjhW8ScUsGGRWVKgVXj5_g@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] powerpc/xmon: Remove PPC403 and PPC405
To: Christophe Leroy <christophe.leroy@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:utiJfzWfkmGAlhawQG4+ntFi2/z7xW2hStxYGyecJh6uyY98KoI
 KoDEsMyI4StClHnxeRiwHpIwii2N4+tsloxcgEplUhLDbnXznHfD/cTqS5iReCtR4aOBtkg
 6TVJgMknG8LJl22OW+C7sFHIrAOWq7DeoVBR4ImLPeVwxEo8SsgVmiOdvs1hsZfqucXmqyc
 kvixZ1H60WFkniZ+xknwg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mOoCqv9FxLI=:mc/cKY2MhxpDFEk9d695sC
 6cI79Vj8ozQv8dBG6tqz/lwvw7bhC/8tqDN+EQW/D7jrvpx9pMt5G5pqI68I5g4JquUdGFPa6
 JOGOeffIBibrh++EJbYhIH+931078/bkobplbcsBA97jATqwflZ1oPdKtaTZBui8CAEV2mLVV
 RkMcxz+hPSjwWWyTf0naOeWQGUWx5MPUGEKJoot6O9AaYBOicfQi5A2ARp74viYESzyjMnPqC
 lvS1S5FmNPTKpnDlj7qHcQm/v6j9J4E5EbheLL2sJFVDoISvht7lbLxeU1q3E6QzCDhFV5dsa
 44R2L7Db3b9Da6yq2vRLxiWshmiSMCyGdozgJYE2aXVi+cb5eOobU5qzwreBbcUeZNQpyCi2K
 Mb7XrZ/dmf3A/rS55W+egHD/PPKhv/fA1euk1gX6Wk6mdtzNBHNBYHMAx5P3zvYaDCn5dX1EK
 g+dyAwqYD9TQZG3gm8Vz6vsc2nGOg3sM8IaGEHqpFeLpsUxQYHLhmUi+BpvZgFt8TUGSr/n67
 N7mBui+vpwgalcCImNUQnEa41GJU53co8C8Bll6G63A4soIikgZKbgUo60WLatPHHL5p3nACV
 ypn+gAUTql5Ba/yXuvhsEhU8Mzm7QAdUVQv1k5VdHVPQnK4OAgzplYNG7EljwxyKaTk74UhdE
 eJz0FRASTxV1kgFc0hUXsFp6WYht4U7hvZiyTnPQbtbk8lndic7uNljEZF+X7NMfW+szFS9Lo
 rdxgdgLIK31qOLVkJhRo5MA1/D7PiuONiSHwI1UOq2HWRTAzdqPegU+aZQ4Gl/L1cCjCi/Giy
 ziYkLRVa0A9GpKzIDwSOjBrAcwfrRTgwCa/iLms21/7bcPmOEw=
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
Cc: Michal Simek <michal.simek@xilinx.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 31, 2020 at 9:49 AM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
> xmon has special support for PPC403 and PPC405 which were part
> of 40x platforms.
>
> 40x platforms are gone, remove support of PPC403 and PPC405 in xmon.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/xmon/ppc-opc.c | 277 +++++++-----------------------------
>  arch/powerpc/xmon/ppc.h     |   6 -

These files are from binutils, and may get synchronized with changes there
in the future. I'd suggest leaving the code in here for now and instead removing
it from the binutils version first, if they are ready to drop it, too.

         Arnd

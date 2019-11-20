Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5788E10446C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 20:42:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JClc63XhzDqjW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 06:42:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.134; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
X-Greylist: delayed 313 seconds by postgrey-1.36 at bilbo;
 Thu, 21 Nov 2019 06:40:46 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JCjB3L9nzDqmT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 06:40:44 +1100 (AEDT)
Received: from mail-qv1-f44.google.com ([209.85.219.44]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MZkYx-1iJZMX2nup-00Wl17 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov
 2019 20:35:26 +0100
Received: by mail-qv1-f44.google.com with SMTP id v16so400695qvq.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 11:35:25 -0800 (PST)
X-Gm-Message-State: APjAAAXnK2sWnX+skfERs59v/+Fp2aTXhaM932vVDbjeEPplIPdbEbuP
 Ho8oaYuewq0CF7bZXElQsP7trmeRIZ1MwrOVk1g=
X-Google-Smtp-Source: APXvYqwHVWU2Zw8xn9+Bv1356Zmszxab3TK1Pmn6hsvPWLI2rMNceeRYyQBX3HSMLK8D/gT8L6zA69sS3PvhoK8Z6J0=
X-Received: by 2002:ad4:50a4:: with SMTP id d4mr4074792qvq.211.1574278524246; 
 Wed, 20 Nov 2019 11:35:24 -0800 (PST)
MIME-Version: 1.0
References: <20191108203435.112759-1-arnd@arndb.de>
 <20191108203435.112759-4-arnd@arndb.de>
 <fdcb510863c801f1f64448e558ee0f8ed20db418.camel@codethink.co.uk>
In-Reply-To: <fdcb510863c801f1f64448e558ee0f8ed20db418.camel@codethink.co.uk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 20 Nov 2019 20:35:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3BPhX_NRFj66WyRLQUOCV-FGRjmPCgB7gqxMoK8hfywg@mail.gmail.com>
Message-ID: <CAK8P3a3BPhX_NRFj66WyRLQUOCV-FGRjmPCgB7gqxMoK8hfywg@mail.gmail.com>
Subject: Re: [Y2038] [PATCH 3/8] powerpc: fix vdso32 for ppc64le
To: Ben Hutchings <ben.hutchings@codethink.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Ol7t1+KR1g9xskK4Abi5MexhqljJOHDz3BkUstKwam/jtKFDps8
 mBHvjTlxr/Ud5JyKD3ep0mcKWLre/eim6D2wpsCq2o2JtkVyN7qQHWhxqGMxEghBf5hrHUU
 VtoVbyR2OqikgvNJCKu17v4oerk+q29RL/wzbBSr/dafgwM1HP/TYoT9WcUoEVdgSABbFlS
 Ryz1xDJJV4cd9yJNXa1qg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/tCvtfurFvo=:hTrjU2RN6hcxCTqw64McQf
 FjKAWFGjYsG7F/ujitjkQmRdR/dvsx/CT75idOSJdvuWvP3E6c0ny3BuhsZ1Fczk/JEPggJRR
 EsyrqajPkaK1aN20X2UX+aariO8/tYOhMnBFejp3QN1H8PRrY4FOgRp5AYfSzomyLYMXftj1g
 2kG2EJaHiff61iYuqLqqU3omSDqPJkK0ve2HuQaV/kBSpyGnS0UYEa8xU45G7blgYQvATcfHs
 aAvbMDC30O1cl07MrYE4BoopSh7FTk/hsjociD8cHEmZRykDsdRgF9dV//i1Ttt3WG+yknnUe
 v6Lo/xSQEpu3WZZHD/OH76l5OYmqvUqDj/5Kqf8oQu77ba8FDo6uQty4UjwfUA+S8HmOzY9Jm
 vMIF64lfZVjXv7UBsCJDs4ciRrEshdAE1FylnsM1mqJmqRvdUW7yT088uCQw1Ckk8KRJ8oMtE
 nr8lwcPOsVEEFyr1cg2GhVuFAhF13UInKTswAwEcZNTdhNdt5Ob+0JeHidVOhXGOPd2OhaqTE
 dfQXaf6NuCrQPML58HBYMVkKFIldlSJA87x5Mmo9IeECTsnGmdDshAZtNQLhfMnSQHmLc2vkC
 dVT1DHrYh0a6vNAPBXye5nHrJnj8AlXGJCSFxVIQGnqPuCrv5wDex6vzCByl7IOHPT2vHcdqT
 vtibmL/+kAKBlNU1XvSI2h/sK8cKHK/C74n48b1jqc2kZbpg4ZHcnV0IPVyHRIVt1l4DAIXFk
 7ErFyYFNwWoY18VFvPiErpYTwVY4EfVFyocjDjPbb9ICQ1ENHVIbR6mP40FirVEQmzQUDSQy6
 s6diVigJJxrvTfqkASfEYOK61gnN4ZVgdvJkKn9QDRmDsGq0Uh4mW5PFWV+CmhwgtZFPz+kCb
 5jj9Cn4jIa+Ut9GmnQ0w==
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
Cc: y2038 Mailman List <y2038@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 20, 2019 at 8:13 PM Ben Hutchings
<ben.hutchings@codethink.co.uk> wrote:
>
> On Fri, 2019-11-08 at 21:34 +0100, Arnd Bergmann wrote:
> > On little-endian 32-bit application running on 64-bit kernels,
> > the current vdso would read the wrong half of the xtime seconds
> > field. Change it to return the lower half like it does on
> > big-endian.
>
> ppc64le doesn't have 32-bit compat so this is only theoretical.

That is probably true. I only looked at the kernel, which today still
supports compat mode for ppc64le, but I saw the patches to disable
it, and I don't think anyone has even attempted building user space
for it.

       Arnd

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C741A8094
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 16:59:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491pYk3GNwzDqQD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 00:59:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.134; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491nG733QKzDqdM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 00:01:18 +1000 (AEST)
Received: from mail-qt1-f174.google.com ([209.85.160.174]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mw9Lw-1j5SKT00W4-00s7LH for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr
 2020 16:01:13 +0200
Received: by mail-qt1-f174.google.com with SMTP id l60so1713528qtd.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 07:01:12 -0700 (PDT)
X-Gm-Message-State: AGi0Publ1MwiE2ff1LQb3l193oGXRFCzRsJ/+RhGdE1PyqzTtOWJYoeC
 bk21za0B3MvJ/ND05PR/T4WsaTmbJpNQmn0ff3o=
X-Google-Smtp-Source: APiQypJnCxnYmw722mKV+S9ulqw05gvvCTLTPiReXurJiDepLa1M4UQL7fvv7Hr4QeMwCm32MRni4rllUWyjgXsOVOQ=
X-Received: by 2002:aed:20e3:: with SMTP id 90mr15912388qtb.142.1586872871915; 
 Tue, 14 Apr 2020 07:01:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200414070142.288696-1-hch@lst.de>
 <20200414070142.288696-4-hch@lst.de>
In-Reply-To: <20200414070142.288696-4-hch@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Apr 2020 16:00:55 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2iHD4tzaNunA2FFpxpQg9DFCKROnrtUR7=1scO76+oCw@mail.gmail.com>
Message-ID: <CAK8P3a2iHD4tzaNunA2FFpxpQg9DFCKROnrtUR7=1scO76+oCw@mail.gmail.com>
Subject: Re: [PATCH 3/8] signal: replace __copy_siginfo_to_user32 with
 to_compat_siginfo
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:9gfsGMAFJbVXNA8P8rwn1HUrbZrOmPtkZQ4b6zHuUvaZjMhrzP2
 T7aa3JRSimMEdonFuWH2aR2S0Pm4Dwk+sIdRWon74E1Oj+wvtKSOmpy1/ZF4isT+PM97VFL
 GX5REtmCaI4uyLw+skBvbLCMSXREJE6fo6fFy0wXKBAjV57cg0KNiLGzAyZ02MNwElwXUOb
 Osy3yY0oayga4csDD7HLQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iTBw5LyPAz0=:Oa+d8SlfHexikpdFAdrrc0
 htyXy6jemV4VDgk+m7b4pbr/vggSn4we1TaWBLvgoam4lpYsn6eXQG/qe6hk7L6rbdMsXcnfW
 NRZ4VfXoO4rNgIMypFMEZmjSoZhGHk+JCCpezv3qRsK0sR7RV6it1ELXmpK5cR0xPgCj6WEi/
 cQEt1u+P4ka+X8mpWyPIKKEvYEOqLIA+29YEwi4/ifruOBQmOmo3LgkJGqYHQSfzYseJLwNjk
 wCmInEcxf9tVUsi0yiBArPN7uGJ1fspdelLI9KH+YNzo2Ad7HtU/3ocXmwh9w6wAB0mVW4wB0
 t3q76ieLzeeT6MRobCLvHOUdyW6umBpKAkt0dGYoqrJbnKZGrIdBavOolZM0O1gQM2urT2zcj
 am685UFxjc37MZ0fvxrA0MSfpEkPiw3DfhfKE3vdbQsvQFN7GgKBh0rbLXoaCZ8NK3B7/Eq5U
 BQy6CcVGxwGknR8W3gFtZ0xBSV/VxjMEO6J6M4/0zeC4/DEOkXfKkywSlOCat4avMTLLRlLDY
 ZNEA1yr3CpW0+shEX131Eb4fcZ2CaGRLm031yv5L1xdUgRnwV1vb8e1o6pOzsF+waOpl+cBgw
 mquL9txPYSW4bd+RnnfvbSxogEqxIRx8l2MSdH7ZBs3Df+cw9GVcp+Wm3ylpdD6gKk+UNDM1X
 p/s6YkPSTPzEmgnvr+JVyxDbeRcyFjpVfSbGX85lGrp/i48zH5crajrI6X2f/loHxLzVo4ckv
 weBDwYIEGV7ycnnhUjb/XlB/OFK5SsUVZH1+QPADmX5E30NNx/+v5sxVtz5HXJmEoRcYiyRVn
 /ACe/ChvgIKLWxqI+n6QbhkVWxzCHj8OvLnHu+FwQ4yHgcRXbM=
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
Cc: Jeremy Kerr <jk@ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 14, 2020 at 9:01 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Move copying the siginfo to userspace into the callers, so that the
> compat_siginfo conversion can be reused by the ELF coredump code without
> set_fs magic.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks all good to me, but I noticed that the naming is now a bit
inconsistent. to_compat_siginfo() is basically the reverse of
post_copy_siginfo_from_user32(), but the names are very different.

I suppose this can always be cleaned up later though, as your
naming choice is more consistent with how things are in the
rest of the kernel these days.

    Arnd

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A3C2C46DE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 18:36:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch7N65ccJzDr4r
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 04:36:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.37.156; helo=8.mo52.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 12743 seconds by postgrey-1.36 at bilbo;
 Thu, 26 Nov 2020 04:34:29 AEDT
Received: from 8.mo52.mail-out.ovh.net (8.mo52.mail-out.ovh.net
 [46.105.37.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch7LF1jblzDr2w
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 04:34:26 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.21])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 3A81A217625;
 Wed, 25 Nov 2020 18:34:19 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 25 Nov
 2020 18:34:18 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006b56b7170-7741-40ac-97e5-c5413baab032,
 13817E1CA0648EB9EE095497159C33290D197662) smtp.auth=groug@kaod.org
Date: Wed, 25 Nov 2020 18:34:12 +0100
From: Greg Kurz <groug@kaod.org>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v3 2/2] powerpc/pseries: pass MSI affinity to
 irq_create_mapping()
Message-ID: <20201125183412.351c96ee@bahia.lan>
In-Reply-To: <5419d1790c9ea0d9d7791ae887794285@kernel.org>
References: <20201125150932.1150619-1-lvivier@redhat.com>
 <20201125150932.1150619-3-lvivier@redhat.com>
 <CAOJe8K1Q7sGf67bdj-2Mthkj4XNR4fOSskV1dyh62AdzefhpAQ@mail.gmail.com>
 <7184880b-0351-ae18-d2e1-fab7b79fc864@redhat.com>
 <5419d1790c9ea0d9d7791ae887794285@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: d6bac3c7-d957-44cb-8e9b-55ca8dec327a
X-Ovh-Tracer-Id: 10779928659030088123
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudehtddguddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehmshhtsehrvgguhhgrthdrtghomh
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
Cc: Laurent Vivier <lvivier@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 linux-pci@vger.kernel.org, Denis Kirjanov <kda@linux-powerpc.org>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 25 Nov 2020 16:42:30 +0000
Marc Zyngier <maz@kernel.org> wrote:

> On 2020-11-25 16:24, Laurent Vivier wrote:
> > On 25/11/2020 17:05, Denis Kirjanov wrote:
> >> On 11/25/20, Laurent Vivier <lvivier@redhat.com> wrote:
> >>> With virtio multiqueue, normally each queue IRQ is mapped to a CPU.
> >>> 
> >>> But since commit 0d9f0a52c8b9f ("virtio_scsi: use virtio IRQ 
> >>> affinity")
> >>> this is broken on pseries.
> >> 
> >> Please add "Fixes" tag.
> > 
> > In fact, the code in commit 0d9f0a52c8b9f is correct.
> > 
> > The problem is with MSI/X irq affinity and pseries. So this patch
> > fixes more than virtio_scsi. I put this information because this
> > commit allows to clearly show the problem. Perhaps I should remove
> > this line in fact?
> 
> This patch does not fix virtio_scsi at all, which as you noticed, is
> correct. It really fixes the PPC MSI setup, which is starting to show
> its age. So getting rid of the reference seems like the right thing to 
> do.
> 
> I'm also not keen on the BugId thing. It should really be a lore link.
> I also cannot find any such tag in the kernel, nor is it a documented
> practice. The last reference to a Bugzilla entry seems to have happened
> with 786b5219081ff16 (five years ago).
> 

My bad, I suggested BugId to Laurent but the intent was actually BugLink,
which seems to be commonly used in the kernel.

Cheers,

--
Greg

> Thanks,
> 
>          M.


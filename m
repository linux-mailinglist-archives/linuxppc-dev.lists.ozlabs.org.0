Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA19F20EB12
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 03:52:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wnRS1ltPzDqV1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 11:52:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Q6HUbLeD; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wnPS0yC4zDqTd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 11:50:30 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id n2so5668973edr.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 18:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5mHuFzQWqAIpV/bjOd1ZMX2Wff0T7CDiptOBml+k1GE=;
 b=Q6HUbLeD2nj68waH+I829FEwmBauUjApbkuAtpy2+N8XAn4Ecs/klCe4ZIlgnHzlye
 fi9L67z0o+Q9hUODw7rLppvbe2fxSgdIOm2gls82YUn8P5PqNTmAxYpEkHVBSEmhchI/
 aaNgVekUA0qSWdSB5qhGKeL8QcThtiyOhvGqejQhuozVCBRR0fs0eY6rE97ElNnFBwTp
 3q6ngXEjbwkbjeM7emxYfDyhEyEdYOEdnoApb1fV91V3tvxj/shXdPJbTs7J6LGNFZw2
 5H24TjuCyAqCaoUsqY0nmjf6zKtu7lN/I0/K0LTTg/JvO/LQT6D04hRkK9bF9hgf2aNd
 FBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5mHuFzQWqAIpV/bjOd1ZMX2Wff0T7CDiptOBml+k1GE=;
 b=EPRXlgWSVI9rzzYC7UCI/zzqkoZp1owfSy/vAIkZ2xC0dfE+3mSzniYKxIfnL660MI
 nx8qj4sDTqzI57Fv4EqBLuPBsqfSzKv/S7nZ5YdI5t/QxtVuzGbAo1EMU3G3xoH9NdLI
 x2QXpaWfpI3Hkc8dNpRcQtvTcPDhuOicJk712bzpz5aShUsQKB4v1+k668jrq3k/0any
 D0mcUJ++OiE9vKWKWQ/BsBxntI1f+OyXIGS/cKX+jA+oHLA/88PpA0E58FzbyCxA+oBH
 +KHsEkaJv9lQOhisSr8j0IyAUIEP/qyh6gHK0uxZaVlULK+/YkdJQRWr3hElaqY8Jz1S
 UaeQ==
X-Gm-Message-State: AOAM530NVajeGoKV/lPtGL8eajGILYo7hH0y9YWHpgldJuESVoQxDR6G
 CG1ZATn85eTvQzxiWCgf7uuCcm1rywrc/bZlzVu0iA==
X-Google-Smtp-Source: ABdhPJyVCpe7LHuMA+1UB9Rfm8NoLpv7tbHYkZ5fYWCXJix1alZTf43Uugpm1DJXymhoSuwVabQ+k/mXHClWOIU4nPU=
X-Received: by 2002:a05:6402:b79:: with SMTP id
 cb25mr1255706edb.154.1593481826315; 
 Mon, 29 Jun 2020 18:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200629135722.73558-1-aneesh.kumar@linux.ibm.com>
 <20200629135722.73558-7-aneesh.kumar@linux.ibm.com>
 <20200629160940.GU21462@kitsune.suse.cz>
 <87lfk5hahc.fsf@linux.ibm.com>
In-Reply-To: <87lfk5hahc.fsf@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 29 Jun 2020 18:50:15 -0700
Message-ID: <CAPcyv4hEV=Ps=t=3qsFq3Ob1jzf=ptoZmYTDkgr8D_G0op8uvQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] powerpc/pmem: Avoid the barrier in flush routines
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jan Kara <jack@suse.cz>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Jeff Moyer <jmoyer@redhat.com>, Oliver O'Halloran <oohall@gmail.com>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 29, 2020 at 1:41 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> Michal Such=C3=A1nek <msuchanek@suse.de> writes:
>
> > Hello,
> >
> > On Mon, Jun 29, 2020 at 07:27:20PM +0530, Aneesh Kumar K.V wrote:
> >> nvdimm expect the flush routines to just mark the cache clean. The bar=
rier
> >> that mark the store globally visible is done in nvdimm_flush().
> >>
> >> Update the papr_scm driver to a simplified nvdim_flush callback that d=
o
> >> only the required barrier.
> >>
> >> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> >> ---
> >>  arch/powerpc/lib/pmem.c                   |  6 ------
> >>  arch/powerpc/platforms/pseries/papr_scm.c | 13 +++++++++++++
> >>  2 files changed, 13 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/arch/powerpc/lib/pmem.c b/arch/powerpc/lib/pmem.c
> >> index 5a61aaeb6930..21210fa676e5 100644
> >> --- a/arch/powerpc/lib/pmem.c
> >> +++ b/arch/powerpc/lib/pmem.c
> >> @@ -19,9 +19,6 @@ static inline void __clean_pmem_range(unsigned long =
start, unsigned long stop)
> >>
> >>      for (i =3D 0; i < size >> shift; i++, addr +=3D bytes)
> >>              asm volatile(PPC_DCBSTPS(%0, %1): :"i"(0), "r"(addr): "me=
mory");
> >> -
> >> -
> >> -    asm volatile(PPC_PHWSYNC ::: "memory");
> >>  }
> >>
> >>  static inline void __flush_pmem_range(unsigned long start, unsigned l=
ong stop)
> >> @@ -34,9 +31,6 @@ static inline void __flush_pmem_range(unsigned long =
start, unsigned long stop)
> >>
> >>      for (i =3D 0; i < size >> shift; i++, addr +=3D bytes)
> >>              asm volatile(PPC_DCBFPS(%0, %1): :"i"(0), "r"(addr): "mem=
ory");
> >> -
> >> -
> >> -    asm volatile(PPC_PHWSYNC ::: "memory");
> >>  }
> >>
> >>  static inline void clean_pmem_range(unsigned long start, unsigned lon=
g stop)
> >> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/=
platforms/pseries/papr_scm.c
> >> index 9c569078a09f..9a9a0766f8b6 100644
> >> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> >> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> >> @@ -630,6 +630,18 @@ static int papr_scm_ndctl(struct nvdimm_bus_descr=
iptor *nd_desc,
> >>
> >>      return 0;
> >>  }
> >> +/*
> >> + * We have made sure the pmem writes are done such that before callin=
g this
> >> + * all the caches are flushed/clean. We use dcbf/dcbfps to ensure thi=
s. Here
> >> + * we just need to add the necessary barrier to make sure the above f=
lushes
> >> + * are have updated persistent storage before any data access or data=
 transfer
> >> + * caused by subsequent instructions is initiated.
> >> + */
> >> +static int papr_scm_flush_sync(struct nd_region *nd_region, struct bi=
o *bio)
> >> +{
> >> +    arch_pmem_flush_barrier();
> >> +    return 0;
> >> +}
> >>
> >>  static ssize_t flags_show(struct device *dev,
> >>                        struct device_attribute *attr, char *buf)
> >> @@ -743,6 +755,7 @@ static int papr_scm_nvdimm_init(struct papr_scm_pr=
iv *p)
> >>      ndr_desc.mapping =3D &mapping;
> >>      ndr_desc.num_mappings =3D 1;
> >>      ndr_desc.nd_set =3D &p->nd_set;
> >> +    ndr_desc.flush =3D papr_scm_flush_sync;
> >
> > AFAICT currently the only device that implements flush is virtio_pmem.
> > How does the nfit driver get away without implementing flush?
>
> generic_nvdimm_flush does the required barrier for nfit. The reason for
> adding ndr_desc.flush call back for papr_scm was to avoid the usage
> of iomem based deep flushing (ndr_region_data.flush_wpq) which is not
> supported by papr_scm.
>
> BTW we do return NULL for ndrd_get_flush_wpq() on power. So the upstream
> code also does the same thing, but in a different way.
>
>
> > Also the flush takes arguments that are completely unused but a user of
> > the pmem region must assume they are used, and call flush() on the
> > region rather than arch_pmem_flush_barrier() directly.
>
> The bio argument can help a pmem driver to do range based flushing in
> case of pmem_make_request. If bio is null then we must assume a full
> device flush.

The bio argument isn't for range based flushing, it is for flush
operations that need to complete asynchronously.

There's no mechanism for the block layer to communicate range based
cache flushing, block-device flushing is assumed to be the device's
entire cache. For pmem that would be the entirety of the cpu cache.
Instead of modeling the cpu cache as a storage device cache it is
modeled as page-cache. Once the fs-layer writes back page-cache /
cpu-cache the storage device is only responsible for flushing those
cache-writes into the persistence domain.

Additionally there is a concept of deep-flush that relegates some
power-fail scenarios to a smaller failure domain. For example consider
the difference between a write arriving at the head of a device-queue
and successfully traversing a device-queue to media. The expectation
of pmem applications is that data is persisted once they reach the
equivalent of the x86 ADR domain, deep-flush is past ADR.

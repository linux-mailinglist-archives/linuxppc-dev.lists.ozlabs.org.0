Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1854F20EF25
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 09:18:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wwgK3zYJzDql2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 17:18:05 +1000 (AEST)
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
 header.s=20150623 header.b=BeT+2qC6; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wwdk4fywzDqY4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 17:16:42 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id d16so8520864edz.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 00:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cj4l0FfWIZexrEyJBVaXKE1UP+4gVH5S5DhnnxEjqJg=;
 b=BeT+2qC6v1slqT3X6EG8MZlgYKAnJOcKbod3ySHD15gfDykCMrkKrOgG357yc/H9fc
 gEpyLIIXyjbjIj6PHBsS9XDPCzRs2t1w0Rvb99ed8tXm69KDpzbYRV3wHbvAJdcoXQJ2
 HvYRvlEaPJWfCfJ7MkI00pb9ZjMbMzqMEAv0gdS8yN8iyQkyX7AuGFHw77eYVyfTgvk2
 yaORzXp6ghCWz5zo/BusxYAae+nKeyVbW9opyOKXKghrbqEpiUtOA3UW06g/IIakUqFK
 12l+2IoAfsx0zAoDWNIzJsOoP9HHJ2ic4eye0n79MPx3UR/NWoNdE89zJlE/L3pHTYKE
 Bksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cj4l0FfWIZexrEyJBVaXKE1UP+4gVH5S5DhnnxEjqJg=;
 b=Nu+PJsVjNm6LPY/T+uj1thIY+3FZAvleVgPME7fmFjKYACAi5RhPre193HGtMBHYyI
 BvDvttcAeVyhcVhPgf/+1Scr7j/pC7RDTEuA5dL2FluxrLGdqnG4LtjeazlxglOaDLyN
 6Ic7kPFiWcPsEsiD9kxEG/iR2K1GQKCTaucpjytY5GtBu3fe/ltUrqvAs9WxJMp3UNFB
 E2ccO1taOvj4n1V90loyZUuDkXyxSYS9RBm+/Ugo2swhRFXOOYtsGmXiahD2sIpfbtnX
 eZv+HZcJSYeGzURowuXwYBh7Q0FVjucbAWXX9Fldfbjgos9MBJRj9NwxFdqJfqCtXQgR
 PfeA==
X-Gm-Message-State: AOAM531ZRkk7xz9Q/WohM7n+Ei4MhkrjAhwJsbskINu83D5hI90nzyZu
 /1bcH+NbjAmegLjbC2ykORtR0LjIZ6ECvcmn6EkAtKh0
X-Google-Smtp-Source: ABdhPJyS8XmrSmjalkHZfnt48YECQbiEpYZIAu0UqS/vLFSq79Y4Mnzjv0etdc0fSJ0YLr8yDJL8qU4W0uJHgKnu9CA=
X-Received: by 2002:aa7:d043:: with SMTP id n3mr22349682edo.102.1593501399478; 
 Tue, 30 Jun 2020 00:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200629135722.73558-1-aneesh.kumar@linux.ibm.com>
 <20200629135722.73558-6-aneesh.kumar@linux.ibm.com>
 <CAPcyv4hFfU0r0GmCgV-wKXq+H=GDV-OPsGNPWmFijrdWm58X_A@mail.gmail.com>
 <87ftadgn3r.fsf@linux.ibm.com>
In-Reply-To: <87ftadgn3r.fsf@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 30 Jun 2020 00:16:28 -0700
Message-ID: <CAPcyv4iuSm40=8qnSKNZxhN5pD_VLra2Qf4iYSwkZfPE5uqkjw@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] powerpc/pmem/of_pmem: Update of_pmem to use the
 new barrier instruction.
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jan Kara <jack@suse.cz>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 29, 2020 at 10:05 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> Dan Williams <dan.j.williams@intel.com> writes:
>
> > On Mon, Jun 29, 2020 at 6:58 AM Aneesh Kumar K.V
> > <aneesh.kumar@linux.ibm.com> wrote:
> >>
> >> of_pmem on POWER10 can now use phwsync instead of hwsync to ensure
> >> all previous writes are architecturally visible for the platform
> >> buffer flush.
> >>
> >> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> >> ---
> >>  arch/powerpc/include/asm/cacheflush.h | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/arch/powerpc/include/asm/cacheflush.h b/arch/powerpc/include/asm/cacheflush.h
> >> index 54764c6e922d..95782f77d768 100644
> >> --- a/arch/powerpc/include/asm/cacheflush.h
> >> +++ b/arch/powerpc/include/asm/cacheflush.h
> >> @@ -98,6 +98,13 @@ static inline void invalidate_dcache_range(unsigned long start,
> >>         mb();   /* sync */
> >>  }
> >>
> >> +#define arch_pmem_flush_barrier arch_pmem_flush_barrier
> >> +static inline void  arch_pmem_flush_barrier(void)
> >> +{
> >> +       if (cpu_has_feature(CPU_FTR_ARCH_207S))
> >> +               asm volatile(PPC_PHWSYNC ::: "memory");
> >
> > Shouldn't this fallback to a compatible store-fence in an else statement?
>
> The idea was to avoid calling this on anything else. We ensure that by
> making sure that pmem devices are not initialized on systems without that
> cpu feature. Patch 1 does that. Also, the last patch adds a WARN_ON() to
> catch the usage of this outside pmem devices and on systems without that
> cpu feature.

If patch1 handles this why re-check the cpu-feature in this helper? If
the intent is for these routines to be generic why not have them fall
back to the P8 barrier instructions for example like x86 clwb(). Any
kernel code can call it, and it falls back to a compatible clflush()
call on older cpus. I otherwise don't get the point of patch7.

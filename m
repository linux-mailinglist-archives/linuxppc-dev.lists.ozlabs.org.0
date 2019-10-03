Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16615C969F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 04:10:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kGgb1KSPzDqW2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 12:10:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="eocGInpz"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kGdh0pHzzDqVq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2019 12:08:54 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id u186so794418qkc.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Oct 2019 19:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=SGn11J1WymPxTPyFDY35t8vkfI2C1blH6swwm2OCJqo=;
 b=eocGInpzDnCjqPIdaO7u+z+4TlrZ1J6RJmtSItG2DS6Yoc0NCeWiujNWvJeSgwrkxW
 DIvpcAhHJ3w1y6e8F48QoH2HRShl/scT79l9eBGvtkuX4NLLqAalykrXmKEAMpQT8l0S
 wCaIHhvBvZSSLrGDf2hg52+biUjQLYeD3tpm0z3C923w7VBIwfY40u8aJ1azXv0/mW0s
 Q3fZXopW5utfwbxj5iF1H5tpFlZtcrtrCvLjBcMEkM8C3Zyw1FHpJa3fran1JwitlU+4
 rcBE/qe1w2RoCcH3vat2mt4m48WrTCnNfBNzjpsL16GvdiiI4bCRDwXJQoQrYwxxWmKR
 MvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=SGn11J1WymPxTPyFDY35t8vkfI2C1blH6swwm2OCJqo=;
 b=dm5FwZPvPSUR1TK53NitcxQ3OJIxFhYaYlZlaettjgdOYmVoA+Ut0/7qk6fPyCbk7+
 xdxrEhCP8/m2/iqweqkxhtJv6ABHAL2zTOfVrYbqoC7CFT0gT/EAg8qTy7xnsXic2LTM
 P/CvCIS+RZbRYFNLK2ZH31tS3mbZvNeRrprHxw2v4QanL1j2jgedmKKP6IGJ5PIPkvd+
 dKqb6GMQXGxrR+XEupe6WotdUbu156IEc94MwfnITzbyU8Qb26sx+gZKdeq/4Z6QM8dN
 Ga8PUACXwGS9eyHsWS6lcIl1Lm0nOVlUf61P0WBOMjFeWVyR1ULqdoOyPQLCLdyfgzSX
 fGhw==
X-Gm-Message-State: APjAAAVyDLhAP6ZxHqYOXRSbPB4PE8E7J0w7d/RfjifFjOz5MWFBg101
 ciuFkAOVbOsYbevMEE8tD8dt9Q==
X-Google-Smtp-Source: APXvYqzQ+RrNGGioxVcVSlkjg3Xh7GYjQWiv2PV5YwfNPap/3P8C3G4pkA3QtVZ96s1JOcYi4xeMhg==
X-Received: by 2002:a37:f61e:: with SMTP id y30mr2081904qkj.208.1570068531083; 
 Wed, 02 Oct 2019 19:08:51 -0700 (PDT)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id k54sm970947qtf.28.2019.10.02.19.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2019 19:08:50 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v5 10/11] mm/Kconfig: Adds config option to track lockless
 pagetable walks
Date: Wed, 2 Oct 2019 22:08:49 -0400
Message-Id: <88228CE0-81B2-4F2F-8C1D-F3376DB25A16@lca.pw>
References: <20191003013325.2614-11-leonardo@linux.ibm.com>
In-Reply-To: <20191003013325.2614-11-leonardo@linux.ibm.com>
To: Leonardo Bras <leonardo@linux.ibm.com>
X-Mailer: iPhone Mail (17A844)
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
Cc: Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 "Dmitry V. Levin" <ldv@altlinux.org>, Keith Busch <keith.busch@intel.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Christoph Lameter <cl@linux.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Santosh Sivaraj <santosh@fossix.org>, Davidlohr Bueso <dave@stgolabs.net>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Andrea Arcangeli <aarcange@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 John Hubbard <jhubbard@nvidia.com>, Jesper Dangaard Brouer <brouer@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?utf-8?Q?J=C3=A9r=C3=B4me_Glisse?= <jglisse@redhat.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, kvm-ppc@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Reza Arbab <arbab@linux.ibm.com>,
 Allison Randal <allison@lohutok.net>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, Souptick Joarder <jrdr.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Roman Gushchin <guro@fb.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Oct 2, 2019, at 9:36 PM, Leonardo Bras <leonardo@linux.ibm.com> wrote:
>=20
> Adds config option LOCKLESS_PAGE_TABLE_WALK_TRACKING to make possible
> enabling tracking lockless pagetable walks directly from kernel config.

Can=E2=80=99t this name and all those new *lockless* function names be short=
er? There are many functions name with *_locked, so how about dropping lockl=
ess at all, i.e., PAGE_TABLE_WALK_TRACKING blah blah?

>=20
> Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
> ---
> mm/Kconfig | 11 +++++++++++
> 1 file changed, 11 insertions(+)
>=20
> diff --git a/mm/Kconfig b/mm/Kconfig
> index a5dae9a7eb51..00f487a0122f 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -736,4 +736,15 @@ config ARCH_HAS_PTE_SPECIAL
> config ARCH_HAS_HUGEPD
>    bool
>=20
> +config LOCKLESS_PAGE_TABLE_WALK_TRACKING
> +    bool "Track (and optimize) lockless page table walks"
> +    default n
> +
> +    help
> +      Maintain a reference count of active lockless page table
> +      walkers. This adds 4 bytes to struct mm size, and two atomic
> +      operations to calls such as get_user_pages_fast(). Some
> +      architectures can optimize lockless page table operations if
> +      this is enabled.
> +
> endmenu
> --=20
> 2.20.1

Return-Path: <linuxppc-dev+bounces-13291-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEE1C07553
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 18:33:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctT493tm2z2xlK;
	Sat, 25 Oct 2025 03:33:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::549"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761323625;
	cv=none; b=esmZu2VZaZEDRLuEEPdrjJ4yjuWK0AJLkRJXOOC4zIt8WZB3iJ1LT00DHg7BRvN7+bpzY8hT0wC1gQdK0RJFE+apLw8zPzbn0npz570D15UX9RyK0rrO67V7QHTcviypkz8tz2cp/vqIn1Y2A5jp1w/n8wlM4csG1d9kMGu5lgdORiVQWf/WAXsZBNWTeF8OxK9xBqKRGTvc81TdHjFhIa9E8X9z39NOrqGabv1C8E5hGw+0tjawBbv76c8G4J06TZPSwaYT7i1hp5N830p4qE9vB5i7cxaeKevAkknHq2MDRn1n1q1qA2skJgXtEG3uG5hmegM6x1AEL7nFaIVgdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761323625; c=relaxed/relaxed;
	bh=XmFbq4MgFLvSavBU+dsE5BY6fpPsL4/gR9QPfUGTSHw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oJ3GlYgD2vUP0zQ9ScvJ74K3TWUvQNSjLV6F8dh3NBb9+X02sXEX73gIYrINLmI8u0hbBzsOjjdQ3MEW9WE9oU2QVU3FKhcVMb4JZvX+nC4+Mi1i0CQjJcgpdjwWPCyy5Sco3CSw5XqTYr8xwByzNQ6+fgdlWEv9NQAtP2ph1WO9LdxiMkQqs9JpWZW2NwWlgvMsgAleYYgSY1aRU9DmJy2VzGTt5Grif9bysF5LNU1zSAwDgNVfcxmikNAgaSFASsJVz00boGhU7ucu5l3OMKqnoMcOoIMDdug1gbTOITjRdCHbhvY++VbhACTzKWMxIkHKdps7ukga411bYwrRDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=R99nrOtD; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3zkr7aaykdpupbxkgzdlldib.zljifkrummz-absifpqp.lwixyp.lod@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=R99nrOtD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3zkr7aaykdpupbxkgzdlldib.zljifkrummz-absifpqp.lwixyp.lod@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctT480JjQz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Oct 2025 03:33:43 +1100 (AEDT)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b522037281bso1398370a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 09:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761323621; x=1761928421; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XmFbq4MgFLvSavBU+dsE5BY6fpPsL4/gR9QPfUGTSHw=;
        b=R99nrOtDsthS3IkGCgT4jmEntokuBM7OiDA0z3HI+7k5RbeyJkQzmVsFRbad1fP/i3
         dDQUQeb77YM6mgPu2kd56rGzafN+o8+nL7S+OLFc9X8M1lZpY/0EdS1ngvCSUMYSytFY
         VwaxrLiHkcK5nuLbk/Ubg0m1YZefskXwMkp/OSngs7M27zLgQ01DaCMgauQO+suUTaCb
         yImFky70fE8PKihAVGxRlBIA+tOFsTO0VUYNZ1t9qjmqOu5FhjQUYP8B0oOCWNJ+tQj3
         OLtbAYZ5h/p93pnv9zqWq+J8tcsHSePX+G87HpP7xBTB4cRCvCBv/KAr7vGt+7UzcHVd
         EwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761323621; x=1761928421;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XmFbq4MgFLvSavBU+dsE5BY6fpPsL4/gR9QPfUGTSHw=;
        b=Td1I3HYzf6Y9DhjzfvyvgtTCaySiXjRi0yBYu/4OMexCMDuIjuyRlHQY2E/joNh+lB
         e8itlSy04VlipjIts1ynIGfSLJEkL87Zxl9xBtchY52oKtaIXtLfilZTWS5SacZuHjll
         vyneleEMNNthEqPMEhnypL6TJacam1GSIqzt4jDtPxOC2u2h8ufNotvNseRQVoO8b5jl
         DZQ8ITtmH9AM1txMPpyxzFldCtfEXAEhgpEMLMqYbGP8B7CqnPuc7QWhNADz1HouAB7M
         wBITMDYEEMH75GWmziY4+ToLNg0jo8XE00qvUyCywrSQdXBxn4gjUBkXaA2scoXMyFDo
         hCwg==
X-Forwarded-Encrypted: i=1; AJvYcCVZNPPLVC75B/xmkTYr+mWRUSUSZHkwoq+0ceDPNfSTIBeiU8fkXR24nXilAcMPl7513BueQ2drZubRczM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxxS8KIhw4QhRkOZOV2QRi7f8o4i/9xpyJYKf0t6n7ONFyu1WkY
	wbXBsOy56e+VfamvZn+OTICm+HHWBs1JTrL/COlUk5sn1hzVkrUbPQjPx+YWEjjCc/+/hBzwn+K
	+Yk1xMA==
X-Google-Smtp-Source: AGHT+IFeKRRbqSfdPI99mHeasG8LL+kiQGTQFDWiy/7cdPCFgXLMLE3NirNFzhTfpVhc/qoTuLXwCz2Ncvs=
X-Received: from pjot2.prod.google.com ([2002:a17:90a:9502:b0:32f:3fab:c9e7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:244b:b0:30f:7840:2c96
 with SMTP id adf61e73a8af0-334a8629ec6mr34771147637.47.1761323620638; Fri, 24
 Oct 2025 09:33:40 -0700 (PDT)
Date: Fri, 24 Oct 2025 09:33:39 -0700
In-Reply-To: <5dea4a3d-c7b7-48f0-b2d5-7597e0cd5f00@linux.intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-14-seanjc@google.com>
 <5dea4a3d-c7b7-48f0-b2d5-7597e0cd5f00@linux.intel.com>
Message-ID: <aPuqYz3ly5a3__mf@google.com>
Subject: Re: [PATCH v3 13/25] KVM: TDX: Fold tdx_mem_page_record_premap_cnt()
 into its sole caller
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Oct 24, 2025, Binbin Wu wrote:
>=20
>=20
> On 10/17/2025 8:32 AM, Sean Christopherson wrote:
> > Fold tdx_mem_page_record_premap_cnt() into tdx_sept_set_private_spte() =
as
> > providing a one-off helper for effectively three lines of code is at be=
st a
> > wash, and splitting the code makes the comment for smp_rmb()  _extremel=
y_
> > confusing as the comment talks about reading kvm->arch.pre_fault_allowe=
d
> > before kvm_tdx->state, but the immediately visible code does the exact
> > opposite.
> >=20
> > Opportunistically rewrite the comments to more explicitly explain who i=
s
> > checking what, as well as _why_ the ordering matters.
> >=20
> > No functional change intended.
> >=20
> > Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
>=20
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
>=20
> One nit below.
>=20
> [...]
> > +	/*
> > +	 * If the TD isn't finalized/runnable, then userspace is initializing
> > +	 * the VM image via KVM_TDX_INIT_MEM_REGION.  Increment the number of
> > +	 * pages that need to be mapped and initialized via TDH.MEM.PAGE.ADD.
> > +	 * KVM_TDX_FINALIZE_VM checks the counter to ensure all mapped pages
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Nit: Is pre-mapped better?

Yeah, updated (and then it gets deleted a few commits later :-) ).


Return-Path: <linuxppc-dev+bounces-10200-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B7EB027A0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Jul 2025 01:26:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bf7BT5j7Sz30Vq;
	Sat, 12 Jul 2025 09:26:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752276369;
	cv=none; b=CjBHQzwam91K1UqtozmXuM633w8IT+BKVUV4Dl4GvrkUs6FkoBcjVDrbrON9buw1c+PrS+ruJwTZss8M0MQdCoUWd8GKlQn75tNbBgj7KgLJbAaQm7IHrFmkbtL70Vd29YO9PycRfkQ7tNCm7MrnBPy+PFAGsJuj9k+yPAyVuw61tbJO3SXRpUZXpycnPc7vaQDSDlRItcgatgPhCtzZhlhdYqR/pbQ6XNz9Cof876OAAx+IkmowyJ79uAfOg66o7KwGLJ8iA5idc/fqAX/UdH+ma1lu67Or78zJ2IOQ7aG+VGIUN0ioLA9109Jl/MuELCqrAgL5d+BoKDXOnm5+Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752276369; c=relaxed/relaxed;
	bh=KNnitWUyVMmZ677TXjq4fGNMFjZQx7zQ4oPAZSNDf8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MklgG42FK4YsS7VSOX1/trv9pxLYZhmAxKMhRPESB+2xSM/9Q27wiZIU132bh/aP6LBnFlurc9rpgmaWC1OruVlUuIT9hpA0hTahPvdapuq8+rR282Ku50B6/9+7PWRED6K1iVp3qgsGKY94KywtmbKXNSZRFSSygbCZcspUJeODZFddddJwRpT+9xqe/D6ckhM0KUlDLe1Scs7QwPtl0A2kbrnUQ1y58uEXkLUgqGxTh16IlFi/nBx8XiWSvsCNqnJgwCoi5lCACi+SY4YqCTtEabC1i/Wzy0UgvfqG4acyPxve2Kj81zjXqhexPrcDdI9mgWwoo2DQKxCqe7JIow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BlwfedKf; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BlwfedKf; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=rfontana@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BlwfedKf;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BlwfedKf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=rfontana@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bf7BP2l40z2yrj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Jul 2025 09:26:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752276360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KNnitWUyVMmZ677TXjq4fGNMFjZQx7zQ4oPAZSNDf8g=;
	b=BlwfedKf4xQJRmveArqEfCsDcKmF9QjMIEtP8xHSNjm41OfV6Uq3UEX+nh7FNZOuCuZ4Tk
	bSixaNTXVpe5dDWjOxl00x21PGOs2gyxJeeNG8z/tbrIXQOH2/qqV9Z+eEvrth1oKAVZsg
	+4FSUEX1vSAO2Sa1gNeXRR51/LFvZW8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752276360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KNnitWUyVMmZ677TXjq4fGNMFjZQx7zQ4oPAZSNDf8g=;
	b=BlwfedKf4xQJRmveArqEfCsDcKmF9QjMIEtP8xHSNjm41OfV6Uq3UEX+nh7FNZOuCuZ4Tk
	bSixaNTXVpe5dDWjOxl00x21PGOs2gyxJeeNG8z/tbrIXQOH2/qqV9Z+eEvrth1oKAVZsg
	+4FSUEX1vSAO2Sa1gNeXRR51/LFvZW8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-sZkb6AxhNOSBhOCjXpoyQg-1; Fri, 11 Jul 2025 19:25:56 -0400
X-MC-Unique: sZkb6AxhNOSBhOCjXpoyQg-1
X-Mimecast-MFC-AGG-ID: sZkb6AxhNOSBhOCjXpoyQg_1752276355
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ae1c79fb8a9so304442166b.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jul 2025 16:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752276355; x=1752881155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KNnitWUyVMmZ677TXjq4fGNMFjZQx7zQ4oPAZSNDf8g=;
        b=t+tGig+hWpebLd4NZVsBJpz/efxE3MwQJAFEWPq9hxCTga2afU3Js7PrbL7lR+t4tm
         stw0nl1kFeH/TI+pfV3z3PQ9UVQW87mpcDHYNGtiLNl3inXCJqnYj+JyJB39BApPdGpm
         t+HcvETMRds/uBOQuC8tFJrroPxBWmQybmu+AyoBkBOG0KwH62a77AEdFPx3da6NO8W9
         HXwQUV8s3g91h+oMm9yxquUqoZpC1DnhxFyaPPoUD+amcpAUsf7xVEZFK9MrCSGh0C3G
         Wn89UXASAQuE9yKwONvqjC6+E3cHnwQWPsUXrRhJHaE3iNfw/SQuF2g6KXEn4dyAu3uy
         ldgg==
X-Forwarded-Encrypted: i=1; AJvYcCXZ6DW3/0MzF3pf1lmtmDSdgAKmIF+dkB2CmP1U1hDRcOd8D6e1v97NYmBxJ9Qwqok/i8TKzScvKBFqG9s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy9RPOWHDag7/tiGqGRRfRse4AgTfe/obP387Gq7GwDLu285u9g
	8i7KJF6SrEQiPYlbtpfLH26K04uu1t56LyV8vmRH5fJeyECj+7nKwu3z1j3tx8g3BV9uIalcg7K
	ATTjNAiJfRoTVfZl5BJU7SOpeHKtq1OZuBgf9+nJa7vsF+jBJEw0bWK3IxlMoaCGOZlhog7GVLM
	Kcsitay4gdeRMk1X3yq52DtXysIVLvHJkuy9PF63FH4w==
X-Gm-Gg: ASbGnctf9MaZKrYZPhzHpxyiieGIZXyXSnWOnR1tWWoM94UJ83hJYlACH+XfY2KDMyn
	j2O4QE1bhPqt+XEaBdNrRKQ9axFK2wswEgjaEyaWSBgDmZ6h7P6IqgXVGO/dxU1I8ewE/KIWrYg
	/1uusTT61flPNXkJGThMSs5w==
X-Received: by 2002:a17:907:1b05:b0:ad9:f54f:70a2 with SMTP id a640c23a62f3a-ae6fbdc90f4mr531762966b.22.1752276355369;
        Fri, 11 Jul 2025 16:25:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFt+iJFpZ7hKPJdxIrpDsRa3jGHWrIka/5oKF32jekBQp3esoTQv/Phk6pp434QyDFneeZCLDCHJ81+4M08gnA=
X-Received: by 2002:a17:907:1b05:b0:ad9:f54f:70a2 with SMTP id
 a640c23a62f3a-ae6fbdc90f4mr531761466b.22.1752276355051; Fri, 11 Jul 2025
 16:25:55 -0700 (PDT)
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
MIME-Version: 1.0
References: <20250711053509.194751-1-thuth@redhat.com> <2025071125-talon-clammy-4971@gregkh>
 <9f7242e8-1082-4a5d-bb6e-a80106d1b1f9@redhat.com> <2025071152-name-spoon-88e8@gregkh>
 <aHC-Ke2oLri_m7p6@infradead.org> <2025071119-important-convene-ab85@gregkh>
 <CAC1cPGx0Chmz3s+rd5AJAPNCuoyZX-AGC=hfp9JPAG_-H_J6vw@mail.gmail.com> <aHGafTZTcdlpw1gN@gate>
In-Reply-To: <aHGafTZTcdlpw1gN@gate>
From: Richard Fontana <rfontana@redhat.com>
Date: Fri, 11 Jul 2025 19:25:44 -0400
X-Gm-Features: Ac12FXznuBL3348HIkyZK48dfJrdmjVLqm_3FxI1CyeUB1LpyaZRNLgOhXRZp_o
Message-ID: <CAC1cPGzLK8w2e=vz3rgPwWBkqs_2estcbPJgXD-RRx4GjdcB+A@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc: Replace the obsolete address of the FSF
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christoph Hellwig <hch@infradead.org>, 
	Thomas Huth <thuth@redhat.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Thomas Gleixner <tglx@linutronix.de>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-spdx@vger.kernel.org, 
	J Lovejoy <opensource@jilayne.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jOllYQ5BGwFUNyq5PkHJYH27C_aRwznJ8iZFGVKJcDM_1752276355
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jul 11, 2025 at 7:14=E2=80=AFPM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Fri, Jul 11, 2025 at 05:02:18PM -0400, Richard Fontana wrote:

> > while this one:
> >
> >  *    As a special exception, if you link this library with files
> >  *    compiled with GCC to produce an executable, this does not cause
> >  *    the resulting executable to be covered by the GNU General Public =
License.
> >  *    This exception does not however invalidate any other reasons why
> >  *    the executable file might be covered by the GNU General Public Li=
cense.
> >
> > does not seem to be in the SPDX exception list. It is very similar to
> > `GNU-compiler-exception` except it specifically mentions GCC instead
> > of saying "a GNU compiler".
>
> https://spdx.org/licenses/GNU-compiler-exception.html
>
> is exactly this.

No, because `GNU-compiler-exception` as defined here
https://github.com/spdx/license-list-XML/blob/main/src/exceptions/GNU-compi=
ler-exception.xml
assumes use of the term "GCC" rather than "a GNU compiler".

Richard



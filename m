Return-Path: <linuxppc-dev+bounces-7332-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89003A70BE0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Mar 2025 22:03:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZMj7k1KV9z2ySB;
	Wed, 26 Mar 2025 08:03:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742917540;
	cv=none; b=gcN+p2S80I1EVTsYJzzsOhgN68H7j4iIzXcO+FgzqIJo4pjyN29ANlI6yOwXVuPezPhCb2uU80CjqSmq0PXJZWENgiK/tN0hFAHfEtDjeKnek+wRzicp8dlI77ZO3ECSGOsVE7OY8tHF7Ci9WgvCFn5qYPs2Cl9mMX2mUhfog6gDLSLxx7LDZSxe43dbIi2SVyPXdnfum/sSxB/sx+lS/E3R2+naLUSTZXBVrcCJHTTlobvQYca6lrhPVP1UmUlA3GwsCv9IoLYMBc7OH2xr+zVLUdAK10yKY8Uri0vbKuY44Qf/r0bNBIHWyLhzGBUfbwPFVEh0AZV55OFx0xvkiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742917540; c=relaxed/relaxed;
	bh=JQEjr2on8+kv5vKVliFWTuZoI19mgZkdWVxtpyWLWw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XvFADGtkLjJbYDz9cnulGjkrK2KhwCXOdROlyLMaQjqborMSH27aGwB8N4ZIJX6R6D9IK+/zLNLULMvqhXVFisJbEQezjhRcfd2NEJOg6QSLtW4i75NHUeNTIWc8cUERpyjF06Zn3BIZc7hn668XCC1b4igRDKQe64Jqh1/WldEx/giGxAEfgjkiWCdaBi8Cof+7qL5SL0Wb5ospGazygyNE6/QuxrF7+pFCBjqVAl6GieaoyOKCBLWHS8AihH4oMaf/jllO6ws8M1NOM/akGiVPnh0CGIXfbsseGVGIb5XN73ovwa3TYO28NBPctNxmFP9vB77PZEWv23XHemQTEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MZcTFur1; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XEHS5onc; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=tglozar@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MZcTFur1;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XEHS5onc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=tglozar@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZMZ4z5GNGz2yf9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Mar 2025 02:45:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742917533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JQEjr2on8+kv5vKVliFWTuZoI19mgZkdWVxtpyWLWw0=;
	b=MZcTFur1uzFTGoVIcactFVCdfHEYe0O9SKs5YKHQYXum+dYoDWae2vKh3OxqktJPHAeiRb
	to/XA6yaCvJJHGXpDfkJaQsQkuojcD3OT67SKlV243iJnTVfTXbD1KbzNYlKjtuUeyY/uH
	xm8SdJ90lo1MiwFd7wMZS9tEjTBRFNc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742917534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JQEjr2on8+kv5vKVliFWTuZoI19mgZkdWVxtpyWLWw0=;
	b=XEHS5oncnrA2i2GUvyYuAsRE09cj3vLwCMewNp0DtHgidrzIG37D2T0O+YwzbMnSF6hBJF
	iOdLtToW2HLA1iBgOD/nMW8VXhZAbXCMUlmh0gYux//cdB8xjWQaOPs9X8IvTG6gxCZS3l
	j0H0L6yvnEopsTh+vT2bCvIW1cRUIVo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-yOgP-kQ3MWmqVrPl3K5Haw-1; Tue, 25 Mar 2025 11:45:31 -0400
X-MC-Unique: yOgP-kQ3MWmqVrPl3K5Haw-1
X-Mimecast-MFC-AGG-ID: yOgP-kQ3MWmqVrPl3K5Haw_1742917530
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac6caf952d7so91488666b.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Mar 2025 08:45:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742917530; x=1743522330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQEjr2on8+kv5vKVliFWTuZoI19mgZkdWVxtpyWLWw0=;
        b=kADhvYghwY4Apa+pNg4BONM1D2WxG2+ydO93k8rtJzyw+BikZrq0M+BjG65kVsw5NF
         2tVow22jxG8brAIjJoT7b80/c5sfL9DxjNUIRr0cDtkYB/lyKitwHbar64Y3yDGao6rB
         TKJnOCkkIIfChwG/lPv6566oOifIRZJrW4CjCvQdfuTnPh73ObcCU+4Nrto4dYIzkogd
         CEaCacech20aIPichXXbquFEHJWvgAcP4cfQefBZfYAB5VRIB8iZD+k3P+aV1EaVJNaT
         gCAs/ynjOheBrRM3V1YsvTOJqr3dYqeYUXw0fAau5sRnBe4u6e6eAHM6Zb3ipmqhwKoo
         uS0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQ/ipPodVbgG45QHgEwDHLnF4ThOpsDA0r/yaby+LhQxHYNfMleQpHUdIt4BFiOhPziuGRm72NcbGuhJg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxBLXuA1KvSc4plgKfjFQemTzPWouu/5lbOQTZdXH++sU0guvZ/
	lm5ZBADIf6O8WqlCfBrZOPEeDdeQRaSsG8bid1NKUpLm0TjK7wxw/h1ml5VfMzXWgOyrG0+l+PS
	9iRBrn9VL6omDzz3LPztkvzZ3+PKkTZVNyDMBrA4wTwVmS8N2SWc2IIDoKllQk4YyjB3Yyh2uxT
	VaZgS07KSuJRUAr7F6jVoEDEBXVkp/59HprnsTicCmgsuNl/n6+3c=
X-Gm-Gg: ASbGncvUXNtN3Roy1JLu64eLoL6vYMPc45U96jiYEwMToPcBWaau+IrL65x74CVwyIB
	cP52NNKKbJYddoetWY/VXQR0B/WhfpVcBwsDssRv/uXrZekd9tK1YVE281k3QN8c5SOvqrR7jOw
	==
X-Received: by 2002:a17:907:d7c8:b0:ac4:4c5:9f26 with SMTP id a640c23a62f3a-ac404c5a21cmr1536625866b.38.1742917529633;
        Tue, 25 Mar 2025 08:45:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeETmw4framl80aCDPCZ4HSMAoLbK1xiEJNCo4pPB8lZTQdmb6dcWKlzwYlP9rfQiUfuMemc5QS9iw9mUlDig=
X-Received: by 2002:a17:907:d7c8:b0:ac4:4c5:9f26 with SMTP id
 a640c23a62f3a-ac404c5a21cmr1536622666b.38.1742917529240; Tue, 25 Mar 2025
 08:45:29 -0700 (PDT)
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
MIME-Version: 1.0
References: <5df6968a-2e5f-468e-b457-fc201535dd4c@linux.ibm.com>
 <8b0b2a41-203d-41f8-888d-2273afb877d0@qmon.net> <Z+KXN0KjyHlQPLUj@linux.ibm.com>
 <15370998-6a91-464d-b680-931074889bc1@kernel.org> <CAP4=nvQ23pcQQ+bf6ddVWXd4zAXfUTqQxDrimqhsrB-sBXL_ew@mail.gmail.com>
 <CAP4=nvTUWvnZvcBhn0dcUQueZNuOFY1XqTeU5N3FEjNmj4yHDA@mail.gmail.com> <a5cccd3a-ff63-4adc-aec1-ad61a58a4b25@kernel.org>
In-Reply-To: <a5cccd3a-ff63-4adc-aec1-ad61a58a4b25@kernel.org>
From: Tomas Glozar <tglozar@redhat.com>
Date: Tue, 25 Mar 2025 16:45:16 +0100
X-Gm-Features: AQ5f1Jqv6H0g9eUrhfuNsHW2oA4i9dAk4ttrUyj157jQhQy6qdUHoOKA23K7Rx0
Message-ID: <CAP4=nvTUcMfXgfLNai2OQmnEiy5wv9OHGZyA1agdA+pUi2cHYw@mail.gmail.com>
Subject: Re: [linux-next-20250324]/tool/bpf/bpftool fails to complie on linux-next-20250324
To: Quentin Monnet <qmo@kernel.org>
Cc: Saket Kumar Bhaskar <skb99@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Hari Bathini <hbathini@linux.ibm.com>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	jkacur@redhat.com, lgoncalv@redhat.com, gmonaco@redhat.com, 
	williams@redhat.com, rostedt@goodmis.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: B5osedC_e5kGdSkkDwof0eRlK2EMu4vjIlrjIlSWJpQ_1742917530
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

=C3=BAt 25. 3. 2025 v 16:27 odes=C3=ADlatel Quentin Monnet <qmo@kernel.org>=
 napsal:
> Sorry I don't understand the issue, why not simply rename the variable
> that you introduced in tools/build/feature/Makefile at the same time, as
> well? That should solve it, no? This way you don't have to export it
> from the rtla Makefiles. Or am I missing something?
>

If I set BPFTOOL in the rtla makefiles, then it won't propagate to the
feature check, unless exported. I observed feature testing of clang
works, because CLANG is set in tools/scripts/Makefile.include, and did
the same thing for BPFTOOL.

> I think this was the intent.

I see.

> The variable name needs to change either for rtla + probe, or for all
> BPF utilities relying on it, indeed. As far as I can see, this is the
> sched_ext and runqslower utilities as well as the selftests for bpf,
> sched_ext, and hid. I'd argue that the variable has been in use in the
> Makefiles for these tools and selftests for a while, and renaming it
> might produce errors for anyone already using it to pass a specfic
> version of bpftool to try.

That sounds much better than renaming the existing BPFTOOL variable,
thanks for the suggestion. I will send a patch tomorrow and give you a
Suggested-by.

> Note: Not that many dependencies, most of them are optional. For
> bootstrap bpftool we pass -lelf, -lz, sometimes -lzstd.

Noted. I must have been thinking of the entire long list of
dependencies in tools/perf/Makefile.config, completely unrelated to
this. Sorry for the confusion.

Tomas



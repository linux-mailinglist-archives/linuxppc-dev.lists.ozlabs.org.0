Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2772255F8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 04:50:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B95nZ3XwyzDqNS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 12:50:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CdpDdzgw; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B95ls75d9zDqQx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 12:49:11 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id gc9so9438265pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jul 2020 19:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=MHAQuV7wqFXE2gTJXyIGBJkkSS+/2fb6/SqEN+IMJpU=;
 b=CdpDdzgwHD6KDQNhDlu82DlmyWWjZ/tE6sKRBv4R+f6DNQQk3obKV028wEN8NHQe44
 ivpvsS3MyhDPBNTyPoxFeJ7XFObRFd8p5lDUvQWmEZLORZNpDUmsYDtCQtQBjWEph5Jh
 4UbuZHebtzX2AFmWHCKMSDCUU6CrNCv//mNYHHIp2g9SX31oJe5mi7j4eUwDehYc29+H
 ylq58SwOBe5p0fVnwPLea9PkWcZG7C43Si1MqGYbndJH1usUs612RiFtiYzoCGbhlNlq
 NNAAB8WinXGMNgzrYPheT/QyRtpMt8ZSuDngMgeue+/ZpaK+oENAp4e9Kc8cNPqxAKW8
 HoTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=MHAQuV7wqFXE2gTJXyIGBJkkSS+/2fb6/SqEN+IMJpU=;
 b=lsE1BNla9GWcUugaz43/YQyMGKwHsKNKH1ezmlLdh6fEYY44499o3gUXJOEP4A3G48
 1BNI4Eu9PPct/mBy7wWMms50ocndRsl3Q2gvugPCY4BnwIR3KyFDVpdI8DiyKHpEDUV9
 zeR5Ni06EuGBmAkVoDKoAJ9sFYhFDvgmoTf+IVQ9aHkV7Obq67rIbOvTX2rA+7flT6VG
 ffFcw+CADcPg/ZMi5ypB6Ax+UZHfSVTe0bHjdXWs0TPwF7haKXifHf0oGR2m3ZR/CriI
 PZjfmRN9RY7o9b/j2RzVs5zHVmvcF/prZCSsWNRnLRLmc8i+98We5/s5fKh5u0WA7rtN
 xHjQ==
X-Gm-Message-State: AOAM531bdbrNgbOLCWO2SAZur0OC8MXd3H9UB8Ox5ZXOJaqUDS2NgG0U
 hRZZe7KaT/3VNyAxAqN3fos=
X-Google-Smtp-Source: ABdhPJyKOJqndxCg3mIhcaYDZPJSsTmVuKMyFWNLPeExLhzmb2sdnZbuRmCL/dLOi+bJNfrzWai0hA==
X-Received: by 2002:a17:90a:6448:: with SMTP id
 y8mr21541193pjm.142.1595213347563; 
 Sun, 19 Jul 2020 19:49:07 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id f131sm13389215pgc.14.2020.07.19.19.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 19:49:06 -0700 (PDT)
Date: Mon, 20 Jul 2020 12:49:02 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 4/4] mm/vmalloc: Hugepage vmalloc mappings
To: linux-mm@kvack.org, Zefan Li <lizefan@huawei.com>
References: <20200413125303.423864-1-npiggin@gmail.com>
 <20200413125303.423864-5-npiggin@gmail.com>
 <0e43e743-7c78-fb86-6c36-f42e6184d32c@huawei.com>
In-Reply-To: <0e43e743-7c78-fb86-6c36-f42e6184d32c@huawei.com>
MIME-Version: 1.0
Message-Id: <1595213278.m30kayfsvu.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 =?iso-8859-1?q?Borislav=0A?= Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>,
 =?iso-8859-1?q?Thomas=0A?= Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Zefan Li's message of July 20, 2020 12:02 pm:
>> +static int vmap_pages_range_noflush(unsigned long start, unsigned long =
end,
>> +				    pgprot_t prot, struct page **pages,
>> +				    unsigned int page_shift)
>> +{
>> +	if (page_shift =3D=3D PAGE_SIZE) {
>=20
> Is this a typo of PAGE_SHIFT?

Oh good catch, yeah that'll always be going via the one-at-a-time route=20
and slow down the small page vmaps. Will fix.

Thanks,
Nick

>=20
>> +		return vmap_small_pages_range_noflush(start, end, prot, pages);
>> +	} else {
>> +		unsigned long addr =3D start;
>> +		unsigned int i, nr =3D (end - start) >> page_shift;
>> +
>> +		for (i =3D 0; i < nr; i++) {
>> +			int err;
>> +
>> +			err =3D vmap_range_noflush(addr,
>> +					addr + (1UL << page_shift),
>> +					__pa(page_address(pages[i])), prot,
>> +					page_shift);
>> +			if (err)
>> +				return err;
>> +
>> +			addr +=3D 1UL << page_shift;
>> +		}
>> +
>> +		return 0;
>> +	}
>> +}
>> +
>=20

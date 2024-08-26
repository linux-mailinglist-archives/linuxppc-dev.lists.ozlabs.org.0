Return-Path: <linuxppc-dev+bounces-491-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 195D295E835
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 08:03:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsg935hx2z2xfP;
	Mon, 26 Aug 2024 16:03:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724652231;
	cv=none; b=BZcl/pz1GaDGPBz07qmrwvI3bqFBWquJcmVgT9qWKEUUV2PJVZ7u6Ae06xkPAFu5oshpAC0YIhRRx0yyziq6A5nGta9qBy/TJmLbXBnUiVKzocw8Sm+mTDobfEvjHtimOkozgq1ZcKrfR2Wrhh7q8WwFU6YgrC7F72iu4uWEob5a42QNrmQBV7Y+6fSqfIzCkBQEaW65OhInmkix2mR5OHd2bClJwLf4IUvDQ6D/JHNNPERCqEvDkqLEDz8NmAE5z2rOJaFUL8WLbo3GZCifzqFJCg0Nzf5CBhPqA6/6VCNSDKV+6eQrGeVzg+D/Hs3zXnnsaMgTfdhQh39WCmhpWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724652231; c=relaxed/relaxed;
	bh=ZKXjBrfmroCoc+jNcJVKdc7dB1QcJh0d700AGCluMS4=;
	h=Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=DS8XQmlQLDlM3u8pHuFUF1alYd2uAY6XvczcYzqHZdPQzH+o/aU99T0aQEgr/eqX/WG4JQP3pT4a8BNDDCqtVzP0d6paMakMslogiE/jWTR/RyejKLS3Y2CqOSlnDjOS4l+MdNe/3J8RmpYr4di61aNQqbElWM04upJwisfDM7YC2ENxBXxg9mQZzaN/4oq/3NlY/dIRdE43GmJ3xKPbgtppxm2TGIct1POmTeG6EKjnm07mfputTogeVqdal2mBwoeefmkOThMi3pf2iyve0Sx6WO8hvgMByRXeV0lyQ1zNqE9dUnBnF1e8mtGgxn7rAkoHc6THC/VQ8P8nyxfZ8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca; spf=pass (client-ip=209.85.222.179; helo=mail-qk1-f179.google.com; envelope-from=djvasi@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.222.179; helo=mail-qk1-f179.google.com; envelope-from=djvasi@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsg926gsWz2xYq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 16:03:50 +1000 (AEST)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7a1d3874c1eso222037385a.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Aug 2024 23:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724652227; x=1725257027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKXjBrfmroCoc+jNcJVKdc7dB1QcJh0d700AGCluMS4=;
        b=YqQg2tB+mbvbyITFXm/fMxCsB79l/ztfYK6rQZeArOjYex4UKoAQJebuHsPMJS+1iw
         gU8Z2TZ4OjXx2b1zQzrCzVlC2/d5Yr+GhG5p9R51nAJ5jAbomteSd15O6lOJwMN86gp4
         J5Z8+wOJtNvCMPooDVd8gllAhfwVt8ZQuYpgX3JjL0xWB31VcFfxtNCNJly8VMt/hiia
         32k4x6kyl1FfUpF0+PakFDLjIZ0pAhDiRbOyNdaXa0SEz8U7ciUOPgwffZYkW0RKGVY1
         GaZHYOdgtnm8bvVcbAr+sI1TYhjzL8q7jvL3GU2pWTc77KOruV/UJbrZrP5tHJ2A//cJ
         Km5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4SW/e7o1QA9O4uZLFiL4Wuw4Aa6YZyYOHbRBDBCEmLoB/sogFd80M5ZBfu+TYQh2eKDLavB8UiqYWNhY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzXUhODAD/zcISf4mzKaxYI3IS0jq41d2qgN90Eb4lCDXeAgU6j
	+XED6jH9CS8Fja1fPSqbvHCNK597BGvsvMpTrE5t2QcVHipdz/Nu
X-Google-Smtp-Source: AGHT+IGSGyPTkUxMgB/i4Zy4QLzMECErNv2aanCJjyDmWf6JxbREWcMAfmUgTeNndDbjPNgn8lnisA==
X-Received: by 2002:a05:6214:3d98:b0:6b0:7f36:8ae3 with SMTP id 6a1803df08f44-6c16dc93d89mr90352156d6.32.1724652226893;
        Sun, 25 Aug 2024 23:03:46 -0700 (PDT)
Received: from [192.168.2.219] (bras-base-mtrlpq3141w-grc-05-65-93-184-127.dsl.bell.ca. [65.93.184.127])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c162db0991sm43641976d6.91.2024.08.25.23.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Aug 2024 23:03:46 -0700 (PDT)
Message-ID: <94540d05-12ab-49b8-9e37-04a29f5cdf77@vasilevsky.ca>
Date: Mon, 26 Aug 2024 02:03:44 -0400
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crash: Default to CRASH_DUMP=n when support for it is
 unlikely
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: bhe@redhat.com, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Reimar_D=C3=B6ffinger?= <Reimar.Doeffinger@gmx.de>
References: <20240823125156.104775-1-dave@vasilevsky.ca>
 <CAMuHMdVYNhFJ+qBDP3_fi9oeHsgOL0vqPe1YqE18+M8n1onssw@mail.gmail.com>
 <87frqsghws.fsf@mail.lhotse>
 <c1fd73a3941c54e58420d7555524cd6baeebfb96.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Dave Vasilevsky <dave@vasilevsky.ca>
In-Reply-To: <c1fd73a3941c54e58420d7555524cd6baeebfb96.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-08-26 01:38, John Paul Adrian Glaubitz wrote:
> On Mon, 2024-08-26 at 12:02 +1000, Michael Ellerman wrote:
>> So IMHO having it enabled by default in upstream does make sense,
>> because it more closely matches what distros/users actually run.
> 
> Well, at least Debian did not enable it by default as otherwise we wouldn't
> have noticed this change downstream.

Debian does enable it explicitly on some supported architectures, but not all: https://salsa.debian.org/search?group_id=2107&nav_source=navbar&project_id=18670&repository_ref=master&scope=blobs&search=path%3Aconfig+CRASH_DUMP&search_code=true

By my count, 6.9's new default affected mips, powerpc (32-bit), riscv, and sh in Debian.

-Dave


Return-Path: <linuxppc-dev+bounces-13461-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67728C16029
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 17:59:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwxRt093hz2xS9;
	Wed, 29 Oct 2025 03:59:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::535"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761670761;
	cv=none; b=keoBr/1wNns6fhveFq+u8gSf6TVxVWS+lHQ9J58mGrAebsoO74tSZmkpuOGT7tdAEOn8dlfvh0lNDY3CKlwu5rJhG6qUorF5HIRR8DZyLy0D5jCVoDa7aEUA3HCdCaJlNXP7wHv796KxoWnBTmuVkJGfj2XR+b1uRqt4OtQXkmtjwzPujMUGFQtrXfnEvbgAaDIfZX9+bReTuPiJgedtb7OQvYiYDl67XmMlZxfdzoIeNCUi2lCPvjvY6BHYGAi9Hm8jdDtXqxmL8VEb56fZyGqzc9+8NZwbrle8J7kBHH2hQd9D/ySLWgxUASo1tkiDiv9is88NRS2ye3NzqEpkww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761670761; c=relaxed/relaxed;
	bh=K2dc0g/PPsN9pIaKjPWHbYZ5oM9jT1rQwz1YwGMpT7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TiYZOBOn8J34Rn5OihnEf4wDDTFGWj22nJo1fmtk8A8Ff4Be/zY6ddlD7yAwL2yN0G5NwFhhE+EcUKFaB3iu56/wLFoqUDhjauO6m9RowZ6M5di8arHFJJiqMbj+jlJqCGNzGqT1O63aSy126MekkCGWoQ2j8JrlecD8IycIHeJLIaJp7Ldv5e3GzSXWv0XXwXWeIfcD20BxLuV+ypl9uFBklAMsWDU2X9JxPL3dpYMU0umbS3BgjmjhJ3qkSo81HTmmCMbEVfn9eT6urogatiBDKSlrFFiWRDicpqZ3Yqj3lCzbr5l8utY/Li9sB2G9Fnf63WnG3To1x/mJpxX+gQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=UyaUHchG; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=UyaUHchG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwxRr3pdZz2xQ5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 03:59:19 +1100 (AEDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-63c21467e5bso3693599a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 09:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761670756; x=1762275556; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K2dc0g/PPsN9pIaKjPWHbYZ5oM9jT1rQwz1YwGMpT7w=;
        b=UyaUHchGHYwgBxhU4Hi+gcwUbM172MZ1ewC1rcytvgxOJercIvBaJYWYcctDlv7cym
         vc3brsre7z81PHyZBJ3ChDZ6w7+NtWfjC/H8gtijkMAEKSXSRQJhaKWUQ1GzA2sbYxn1
         ewKQMDgaZvLltGqU5d/cRAF9+mvpYn3A+ifTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761670756; x=1762275556;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2dc0g/PPsN9pIaKjPWHbYZ5oM9jT1rQwz1YwGMpT7w=;
        b=naPLwH3S5fwG6U8ZGh4NlDRvy9KlfvAXntlUa02LYKKGadrwN9qrnb9pwyFUMtt8P5
         SuWWhUK7oRvA+X14IqQC20fvQOsUH2/lTm2rQ+O17Rwvi69ktEXK/cfqSlP167EfxTin
         Zja8k6t07ZPVZuiuMEVsQkKr7OJlxZqGh4kkbGpzo8MK/mzArPq3fPAPIVbT6w+qWy6F
         1MP9RY1eBeKZqHPK83V0ZWn8kGz7hZyT0sj82Q7opkFGSwZ/uqFqH2ad/QOZV4P9xeXf
         IQReXpJw1oWPEpSpCQZraLdDw7uBwYvchU/ExcXPZM37Lbk/RAWQDpDylfnBsdbVB+kI
         TNsA==
X-Forwarded-Encrypted: i=1; AJvYcCUSzXLF9q8Wf0mdqmArJ8gc8lA7TkJudb0L1jG0HiA76/D5May6sD67un1I4SQot8bCcz8zepTt36p0H+4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwQ0Gvjz99k6LsJTdPvV52pBt+VperHxlmN5k3tr3HgHj0+SHYV
	7GA9q8MaycC/5tWsHtfNkifOzhu1MJM7WLbl/CoiHY4Dy5dneJ+i0iEAm4cy5D6/wHS9J46ShY/
	zzyPz/DMvzg==
X-Gm-Gg: ASbGncsaKQyEbQFGa02Y0TSdzmt6Kx7+95kfheAOkBnXZ4aMK2q+JtRvj7DQQcotNKt
	KDGodb9DeX26K9sZIAsdn0rB7yXjnG6w/dTeOPPN2p7yjEs4n9kx4Znlqbau0JD7op29nSHCIFD
	T0klSRhMHhHbnLQFvqbqEHdWdktEFdy9fHW29C/5rLoNtmTZqcty+VGrJfh+vZrG/jF0+iILVBT
	iHSem/uBMpMX99ueSJNzoU/E/AOq1W5/GE/2tI1BQpceKr7LN8qRQAsK3iaY6MwOqlwGFqN+PXP
	/MhaaT+76Uj+2qR7pnIKQoNm/a2SZr5xIj7/lytHrd7rFfAJSF6MEUVes0gRwMwTjyjTvznoA9+
	0+1mJLeAR30fsmaBTefdaOZjuURJjbViJGnGoM4A5oUPmehwGOqL/iJXwmhhgBAqyUlmSHDxn6i
	/lvEGTvC9nzHwDsNYCT5k5Xdw3NrTEwUrMdld95YLDazGHD2HfDwM96GpFlmK7
X-Google-Smtp-Source: AGHT+IGg9xHxaDCtV+J1rifTG1G7sl0y74s4hvIkU4dvNS0JgYl7BYvld1yaTjp9W8qWAr1POs//sg==
X-Received: by 2002:a05:6402:278c:b0:63c:2e3:6cb with SMTP id 4fb4d7f45d1cf-63ed8cc030bmr3904159a12.26.1761670756112;
        Tue, 28 Oct 2025 09:59:16 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef833besm9265111a12.15.2025.10.28.09.59.15
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 09:59:15 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b403bb7843eso1348782866b.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 09:59:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW7X8VR1kemPzdBS2kbmRx1DpT3gi8OM8NmH62HCjElOnASNRwjp4DNiW/v552pQzV48xOVTqhmzHWGIFw=@lists.ozlabs.org
X-Received: by 2002:a05:6402:5244:b0:637:8faa:9df7 with SMTP id
 4fb4d7f45d1cf-63ed8cc16aamr3779861a12.29.1761670755473; Tue, 28 Oct 2025
 09:59:15 -0700 (PDT)
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
References: <ea7552f1-842c-4bb8-b19e-0410bf18c305@intel.com>
 <20251028053330.2391078-1-kuniyu@google.com> <20251028095407.2bb53f85@pumpkin>
 <CAAVpQUARk-XeMdTeGy_s65sdwuLY2RzocGyJ=2_WkhsrFN-bUw@mail.gmail.com>
In-Reply-To: <CAAVpQUARk-XeMdTeGy_s65sdwuLY2RzocGyJ=2_WkhsrFN-bUw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 28 Oct 2025 09:58:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiTN=1Sm5DVnXDtQ-tSiPuz-7QVpgP2vt6LgaEnhbubfw@mail.gmail.com>
X-Gm-Features: AWmQ_blBlp8rG7EHRLe1uP1FYCp4LO5ZZWflvlu1_iOk9v8s-pHpb1shOoMSUXA
Message-ID: <CAHk-=wiTN=1Sm5DVnXDtQ-tSiPuz-7QVpgP2vt6LgaEnhbubfw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: David Laight <david.laight.linux@gmail.com>, dave.hansen@intel.com, alex@ghiti.fr, 
	aou@eecs.berkeley.edu, axboe@kernel.dk, bp@alien8.de, brauner@kernel.org, 
	catalin.marinas@arm.com, christophe.leroy@csgroup.eu, 
	dave.hansen@linux.intel.com, edumazet@google.com, hpa@zytor.com, 
	kuni1840@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mingo@redhat.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, palmer@dabbelt.com, pjw@kernel.org, 
	tglx@linutronix.de, will@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 28 Oct 2025 at 09:42, Kuniyuki Iwashima <kuniyu@google.com> wrote:
>
> This is the Zen 2 platform, so probably the stac/clac cost will be
> more expensive than you expect on Zen 5.

Yeah, clac/stac are horrenously expensive on Zen 2. I think they are
microcoded - and not the fast kind - so effectively serializing.

They got enormously faster and pipelined in later Zen microarchitectures.

Sadly, Agner Fog doesn't do timings on those instructions, and I
haven't found any other place that has some overview of the
performance on different microarchitectures.

                Linus


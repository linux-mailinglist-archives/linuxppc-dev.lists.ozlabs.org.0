Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5755C792
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 05:09:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45d8NJ4M1KzDqT7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 13:09:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Al5//5gO"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45d8LK5M9LzDqSx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 13:07:34 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id j2so7513180pfe.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2019 20:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=JEjj/PPo3yxC7A/OXv38wkR3+utyXU9OEcFxU+K+Oro=;
 b=Al5//5gOeoq+S2jUF4fWN70LRFW/gTgt2BAn2B0baRvM15+mvep+e5s4otLVXnFidS
 xBIE1sEHhvdBjGVQNKvZJxJgS3UdF4SDPQWO2bZ1qZ6vVx4wQIRlG/Q0PHTSe7GdH1CN
 9cMVFo4aSiPy+/dKIODZEmbH7MLbzA/dmpvmep3x/AmEilTks2v/Y+pWLjIn9LQ0PH9R
 y3GTlAck0dxdUgSPhIuZPl2WokIMtkaDzckYgT3LAIei69JVQwqvYIY52W+nZxNG0pqj
 e8Okec5QN1hZ74rwLSruZokYUZf+wjNVH5HrnYrKVrKxKFTKrXBjDp1EUoQxYsO+hF7X
 1bMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=JEjj/PPo3yxC7A/OXv38wkR3+utyXU9OEcFxU+K+Oro=;
 b=PnN6GuSIvkdHNZSzkSrtKWWgKekQoklFna74/otAFcULP1lzvFRiV5JKnc3yvW3Ro5
 HPRGyM7/ayq1bTmtQNnrxLzEDkH+25GDFOg2vmlpPQKEtYVPW6NNyfGXeZLpPhsr1riH
 htv6Ko2FVoNN/H0HrxTI6cDID4wIT5txaOuUosGUtcGzdiNNQdw2h4OCIBDjHB3BGwCU
 SDEl5HkQPKLT0UglGUI0oNoL2L4UG1ZybvB3llBMgiFmx6s8H+z2bDW1laMhX6ndr3kv
 j6KbVhGabY7rZygaBk0wbWVc+uohkssdLzm4i6D6qmw3z90ZfF+tCGqiRZxZ3mxxZqWR
 Ug+Q==
X-Gm-Message-State: APjAAAWrIb6Cb1KA8GgrkveQ+RUmGo+eJR5spYS2j5B0XY0S2wcHE3Te
 /JuRXyEJWrb28zu3Mxc5n84=
X-Google-Smtp-Source: APXvYqxOVg0HFcmLKK0QMTMU/kWLAUMGqHvjW+x4ulftF7VETnHP5SSk6O+UdayEdNaJVHGmMdn0Lw==
X-Received: by 2002:a65:6102:: with SMTP id z2mr27238296pgu.194.1562036851675; 
 Mon, 01 Jul 2019 20:07:31 -0700 (PDT)
Received: from localhost ([175.45.73.101])
 by smtp.gmail.com with ESMTPSA id f11sm10274123pga.59.2019.07.01.20.07.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 20:07:30 -0700 (PDT)
Date: Tue, 02 Jul 2019 13:07:11 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Re: [PATCH 1/3] arm64: mm: Add p?d_large() definitions
To: Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>
References: <20190623094446.28722-1-npiggin@gmail.com>
 <20190623094446.28722-2-npiggin@gmail.com>
 <20190701092756.s4u5rdjr7gazvu66@willie-the-truck>
 <3d002af8-d8cd-f750-132e-12109e1e3039@arm.com>
 <20190701101510.qup3nd6vm6cbdgjv@willie-the-truck>
In-Reply-To: <20190701101510.qup3nd6vm6cbdgjv@willie-the-truck>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1562036522.cz5nnz6ri2.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Will Deacon <will.deacon@arm.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Will Deacon's on July 1, 2019 8:15 pm:
> On Mon, Jul 01, 2019 at 11:03:51AM +0100, Steven Price wrote:
>> On 01/07/2019 10:27, Will Deacon wrote:
>> > On Sun, Jun 23, 2019 at 07:44:44PM +1000, Nicholas Piggin wrote:
>> >> walk_page_range() is going to be allowed to walk page tables other th=
an
>> >> those of user space. For this it needs to know when it has reached a
>> >> 'leaf' entry in the page tables. This information will be provided by=
 the
>> >> p?d_large() functions/macros.
>> >=20
>> > I can't remember whether or not I asked this before, but why not call
>> > this macro p?d_leaf() if that's what it's identifying? "Large" and "hu=
ge"
>> > are usually synonymous, so I find this naming needlessly confusing bas=
ed
>> > on this patch in isolation.

Those page table macro names are horrible. Large, huge, leaf, wtf?
They could do with a sensible renaming. But this series just follows
naming that's alreay there on x86.

Thanks,
Nick
=

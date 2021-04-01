Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E32EC3512AF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 11:48:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9yzl6hGWz3bsB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 20:48:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=r8PmL1JI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=r8PmL1JI; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9yzL0WJzz2yjS
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 20:47:57 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id c204so1075356pfc.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 02:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=e28mP4vqW0wK0RDVgiCQ9UNycWD3MSCRgzIo6Rq/6EE=;
 b=r8PmL1JInEYuHXsXziEAl4FhtQ8tkm5YYezN1iNK5USe1peYsO5pAm/JfujCotTziZ
 caItmqZEM77iVQAhb23OiUA9AZZkaeOrOCh/MWjSVkmZDQgB+CvzYfO433X5ggtfiMQf
 NIGv+sfgiHJ1PrpidFSEB/rnFKG8QWoL25bya+lcXhPZOizyQM6ATdqb3FmfMlSav8sG
 97KveMpQhPCOcF2qLsigKfgpWHniO5WqOSsL1jT9aCVAAotDPIeGs3nRuU4c3lZzlNf6
 qzJxTcpz4l11hXEbkXECesLXgr50mBN/tk+445gLEQ28DnO1JUlpDvaUFgXQDq0RwEQG
 KK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=e28mP4vqW0wK0RDVgiCQ9UNycWD3MSCRgzIo6Rq/6EE=;
 b=lkTXq9fXedOlt0QQK+v9GCUkaA2S7AF2sWQQWmvjezV3EeJKZniyoYpwNX/CJ4Atns
 fGoXwbecmn3DL1Q4/SXNZTIJG9L3q/+lUghSSNhK4PktfBVbm1jGlpcF2qAWa82x8lD2
 QupCQYrtoKfXKDcx1DNIXKRqBIazvWxti/+aEXo9kF0OvXgiayaHHlHjbB2lLfRoyngk
 IOi2aurw9rtcVfrJDFfa1iLDqgHoiNtu3fMuJ6zP014OQ4qKmQP2nEf0xL5IFjWj4ptp
 YOcDBYXfGEePj0AWRw9OqPkmFs66VNJr7CAwzM2TlkAJgUb5jRAo38tfvG71Axt+udNJ
 kH5w==
X-Gm-Message-State: AOAM533M71YUduogh+/RrpwM/Jt2VZqhgmpzWC/7yBt2vYcLLTqbLIf7
 SlCBZ0OoqTrcSQSgDECJz+c=
X-Google-Smtp-Source: ABdhPJz+WaoWgQlCxrZ2aX6kZeOc8PjTx0Uv4z/wkSQMW/gQi0ep/6WO1H8Hi0ezqCZrQ9b0AeHMpw==
X-Received: by 2002:a65:6483:: with SMTP id e3mr6858076pgv.208.1617270475657; 
 Thu, 01 Apr 2021 02:47:55 -0700 (PDT)
Received: from localhost ([1.128.222.172])
 by smtp.gmail.com with ESMTPSA id ch15sm4703580pjb.46.2021.04.01.02.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 02:47:55 -0700 (PDT)
Date: Thu, 01 Apr 2021 19:47:49 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 09/46] powerpc/64s: remove KVM SKIP test from
 instruction breakpoint handler
To: Paul Mackerras <paulus@ozlabs.org>
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-10-npiggin@gmail.com>
 <YGQAfCOAR5Hfj13u@thinks.paulus.ozlabs.org>
In-Reply-To: <YGQAfCOAR5Hfj13u@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Message-Id: <1617270447.zkb024siva.astroid@bobo.none>
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Paul Mackerras's message of March 31, 2021 2:54 pm:
> On Tue, Mar 23, 2021 at 11:02:28AM +1000, Nicholas Piggin wrote:
>> The code being executed in KVM_GUEST_MODE_SKIP is hypervisor code with
>> MSR[IR]=3D0, so the faults of concern are the d-side ones caused by acce=
ss
>> to guest context by the hypervisor.
>>=20
>> Instruction breakpoint interrupts are not a concern here. It's unlikely
>> any good would come of causing breaks in this code, but skipping the
>> instruction that caused it won't help matters (e.g., skip the mtmsr that
>> sets MSR[DR]=3D0 or clears KVM_GUEST_MODE_SKIP).
>>=20
>> Reviewed-by: Daniel Axtens <dja@axtens.net>
>> Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>=20
> It might be worth noting in the commit message that the 0x1300
> interrupt was dropped from the architecture a long time ago and is not
> generated by P7, P8, P9 or P10.

Good background, I'll add that.

Thanks,
Nick

>=20
> Acked-by: Paul Mackerras <paulus@ozlabs.org>
>=20

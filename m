Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C8184E3E6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Feb 2024 16:19:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZnwGRyNa;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZnwGRyNa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TW0z14QMDz3cWx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 02:19:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZnwGRyNa;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZnwGRyNa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vschneid@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TW0y95fRfz3brB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 02:19:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707405548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jC5ELXrvlO45sPj4MDJFCPeH9dCnSddJr5cpxY/vovY=;
	b=ZnwGRyNakx9UAfDMRAwjoiZlmpYPf14SZWPJJs1uHDCNeGR91O/c7BaNIdFLK+wgUWc2Su
	To0rcTQFLOW1F4VaPfZIrJP6YeMwOkDcJMoBlciceS7qe/nK4oApWaFyEGtKTbwtD8vAkv
	8H0IqFqEqSMVxp4nlhRQU3wJ/ruab20=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707405548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jC5ELXrvlO45sPj4MDJFCPeH9dCnSddJr5cpxY/vovY=;
	b=ZnwGRyNakx9UAfDMRAwjoiZlmpYPf14SZWPJJs1uHDCNeGR91O/c7BaNIdFLK+wgUWc2Su
	To0rcTQFLOW1F4VaPfZIrJP6YeMwOkDcJMoBlciceS7qe/nK4oApWaFyEGtKTbwtD8vAkv
	8H0IqFqEqSMVxp4nlhRQU3wJ/ruab20=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-cMiqC0u_MqGal7uBdH9_Cw-1; Thu, 08 Feb 2024 10:19:04 -0500
X-MC-Unique: cMiqC0u_MqGal7uBdH9_Cw-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-68ca88ebb88so22140466d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Feb 2024 07:19:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707405544; x=1708010344;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jC5ELXrvlO45sPj4MDJFCPeH9dCnSddJr5cpxY/vovY=;
        b=hvdlQ4IgflMMME61qqzw7UuTXwkyzF1waKUVe59KhTXjlLk35qRrXO3qP2hjZOx679
         Hj2kBwWU2+n334X721LcjlSHzJhKL+jKI21mXWZER2RlN4tFYxNMbxOf0uyFO+Xs5hDK
         GplITAxhqN86QjKPUy/iC0wcBWQnt9/zC4kRYCom8OtMXx2wAwUtfs4B5dVKLjeQPeV2
         +i8HBCwrJyPfvAHXG50L68nxFsLpztizQmtanMYDL4p85bnicq/cXwboO6/S1z+vPcGS
         sNcYIQ8ta+1upxYq/SXNTK2YUi4W2hAS4+X12ZMRLdwQ26NY6lmaGQwM9S2h9G+ryy1d
         ICpg==
X-Gm-Message-State: AOJu0Yxebsnpl7lnz9mIRgAQxr0m2cIgsTY9BOzP4r+iXVZ5BXSFT/pP
	tFBet2u8w4M/80REx8NnXwuMzpO6PX3tkuG0Ivf6nOVpZOQpmEYcZy3FWjHxUDV+vHT57CdFQne
	avNaliiuvl57xgDkIpnI3n9CuzlPKsHkH3vRKZHAkVezqQl/IlHwyZAHKmOkVz90=
X-Received: by 2002:a0c:f28b:0:b0:68c:cf75:f3ed with SMTP id k11-20020a0cf28b000000b0068ccf75f3edmr312817qvl.36.1707405544172;
        Thu, 08 Feb 2024 07:19:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPHo2q5+5ap667UZTnNXH7EL+viO7Q3SQ3dk2Fw+Na2aQNXd0SHm24FatVHL7uUZWEREJmdA==
X-Received: by 2002:a0c:f28b:0:b0:68c:cf75:f3ed with SMTP id k11-20020a0cf28b000000b0068ccf75f3edmr312779qvl.36.1707405543881;
        Thu, 08 Feb 2024 07:19:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX1vzpgWCr3GkZVrTqbWZpqwXV98dgoymDuP6/yj1JYcHSyTcMzDSbdcuymXQAp6RZ5AJ2iJJ37yXibzzcDg1UtvuVKRxS1ah1KaZY9cYQeCu9b+bB3c901lH68PkXBlTseR4itW/SavmR+Xtk6MinI2l1fgjAfswOHPLc8xTzvm8wsVYhR7AHm0s2DdThVX7r+y0AmvPY8YDLgS3sW5uJwaEBKFgnvHDTspFcY1q9Nyg0Gx1rda2sxlOusBSHmX3ARCerFCmPonpwX9l4Owi6MovZAirRUiRzV1Nx/UU25xIvLPMIWikYy+KJbL/MOPXQjinqSzXUs2s+sPHy9TnUm5unxugSKgDC9CmPxpQn22eDy4a2bebK8b2R3QuyRDoO5Kxbky6mXcNalp67WmRezJRhlf0OsHume+V9nu3mqJnawnx+5S1MnYL8JhJ71O8I9D4XEg1LcmR8Bv6clULulmG8HjTXN4U+/C+kZfS2s3BoZ6baMyXf7rjzw1hL4cgdFGLK1EVVEH63ADuDxCytjOH5ZnjzKxPBDX3Mm9o32SI8NDioqaZknh48tFkE+ixi56fdOhOPnavUvAGbbjUJUERdxC46W5jCeS3Rzd4AhsG5DlqGdsPPZdexMxR9ExQOqP/S5VtLH+GckqG0uDkfRldcOJ9Lupb02IRpCSDijfahGljo1YHDwqHbHhK+Tn2I5TSJfSeAcqsM43eY0tMH9oU3Ef56wi/g6pVsmrYBliOp7ePwN/A==
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id p16-20020ad451d0000000b006862b537412sm73991qvq.123.2024.02.08.07.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 07:19:03 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: alexs@kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, "Naveen N . Rao"
 <naveen.n.rao@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>, Frederic Weisbecker
 <frederic@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Barry Song
 <song.bao.hua@hisilicon.com>, Miaohe Lin <linmiaohe@huawei.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/5] sched: rename SD_SHARE_PKG_RESOURCES to
 SD_SHARE_LLC
In-Reply-To: <20240207035840.936676-1-alexs@kernel.org>
References: <20240207034704.935774-4-alexs@kernel.org>
 <20240207035840.936676-1-alexs@kernel.org>
Date: Thu, 08 Feb 2024 16:18:58 +0100
Message-ID: <xhsmhv86zf0gt.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Yicong Yang <yangyicong@hisilicon.com>, "Gautham R . Shenoy" <gautham.shenoy@amd.com>, Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Alex Shi <alexs@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 07/02/24 11:58, alexs@kernel.org wrote:
> From: Alex Shi <alexs@kernel.org>
>
> SD_CLUSTER shares the CPU resources like llc tags or l2 cache, that's
> easy confuse with SD_SHARE_PKG_RESOURCES. So let's specifical point
> what the latter shares: LLC. That would reduce some confusing.
>
> Suggested-by: Valentin Schneider <vschneid@redhat.com>
> Signed-off-by: Alex Shi <alexs@kernel.org>

AFAICT it's just missing the below replacement (I've stretched the comments
to go up to 80 chars while at it), otherwise LGTM.

Reviewed-by: Valentin Schneider <vschneid@redhat.com>

---

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index e877730219d38..99ea5986038ce 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -657,13 +657,13 @@ static void destroy_sched_domains(struct sched_domain *sd)
 }
 
 /*
- * Keep a special pointer to the highest sched_domain that has
- * SD_SHARE_PKG_RESOURCE set (Last Level Cache Domain) for this
- * allows us to avoid some pointer chasing select_idle_sibling().
+ * Keep a special pointer to the highest sched_domain that has SD_SHARE_LLC set
+ * (Last Level Cache Domain) for this allows us to avoid some pointer chasing
+ * select_idle_sibling().
  *
- * Also keep a unique ID per domain (we use the first CPU number in
- * the cpumask of the domain), this allows us to quickly tell if
- * two CPUs are in the same cache domain, see cpus_share_cache().
+ * Also keep a unique ID per domain (we use the first CPU number in the cpumask
+ * of the domain), this allows us to quickly tell if two CPUs are in the same
+ * cache domain, see cpus_share_cache().
  */
 DEFINE_PER_CPU(struct sched_domain __rcu *, sd_llc);
 DEFINE_PER_CPU(int, sd_llc_size);


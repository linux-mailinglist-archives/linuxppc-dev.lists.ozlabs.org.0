Return-Path: <linuxppc-dev+bounces-7330-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 737D9A70BDD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Mar 2025 22:02:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZMj6t1dQdz2yGY;
	Wed, 26 Mar 2025 08:02:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742915369;
	cv=none; b=MPZcaeDJ37FH8pWZCf7gMd1x5A4fu+v9SMF4n6W9AP5bfptcAk3ZzMh76VTbayYrJJRTABAwPd/CcLhP99GBEiypJuv84uAplf0bGQVqQvfKrVMy8d/gjGEyr6klFFOLNPZOYYd8CbQSUdCKzkNlyII8xphhXEEC41XoskUTPCo8mCK+gYOB0nZ7CyTRaFomhfhw2xI57SGwugMIRJ73SgSsYZBRaxc2Jl2MlMEnbX9OjcARaTBIDI3QU3j3hCdqEdJeHzCpUk4ec/UV2FNYiSjk4niwtqjsDSx09MPBVycvI8elpqw+XNgOc1jrLd0seJjlJCDXFpiWu3DH5gYgLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742915369; c=relaxed/relaxed;
	bh=XN1UHaGDDAyR/HBjdq/nPcvza0hCo9xY6Kb/vT4i1gA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e/Jc36UMURQhv4hkZSvLAtPJ5ImnU73TBdUtWb8M9t9CJsmywQXNycquUD0Qu3nsyUOdta+YeIl69COl43ABhSgEjnbkisAsbRcD9QUL1QJwDbM3lw6ZInsOfccHFVoQ1JMji35mWhwZV4G83OkGJZSJ325r279Bvs57SdiPeWLuHCrVRGfH81YbBwDjfF8rE3wMtrCPEJD2DeaQfSm+WbKQsE3aBIkq47m6kNqXm/63GX3a849BQp665AJl2XP7Q4thf+obg512DxkVED9jZBaAq9GxWhF5QRzDG3UdPoTVWKZPjDPPV4GkrdiwNKc1eHKW5MU5DU4LDsnQ3gfCow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PoHFEBED; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PoHFEBED; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=tglozar@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PoHFEBED;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PoHFEBED;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=tglozar@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZMYHD56qxz2yGN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Mar 2025 02:09:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742915364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XN1UHaGDDAyR/HBjdq/nPcvza0hCo9xY6Kb/vT4i1gA=;
	b=PoHFEBEDhG6gg4ciCGnCJpRycz6Lz25z9M7vNMUQhNr/wZrU5YPG6BzxCBSNYHSk27KvLu
	+AJo4qp6iUBwW9d30kEXKCZpuROF2JRoao4gIDYlOjsvK3eEzZDWn+AB2pmg5DMEZIIwK9
	tqpAXEVoM9avTwIw/fVyuGdRXPheWSY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742915364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XN1UHaGDDAyR/HBjdq/nPcvza0hCo9xY6Kb/vT4i1gA=;
	b=PoHFEBEDhG6gg4ciCGnCJpRycz6Lz25z9M7vNMUQhNr/wZrU5YPG6BzxCBSNYHSk27KvLu
	+AJo4qp6iUBwW9d30kEXKCZpuROF2JRoao4gIDYlOjsvK3eEzZDWn+AB2pmg5DMEZIIwK9
	tqpAXEVoM9avTwIw/fVyuGdRXPheWSY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-p2LmMl3GM2ewmFL9aaBf5w-1; Tue, 25 Mar 2025 11:09:20 -0400
X-MC-Unique: p2LmMl3GM2ewmFL9aaBf5w-1
X-Mimecast-MFC-AGG-ID: p2LmMl3GM2ewmFL9aaBf5w_1742915359
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac2bb3ac7edso558641466b.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Mar 2025 08:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742915359; x=1743520159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XN1UHaGDDAyR/HBjdq/nPcvza0hCo9xY6Kb/vT4i1gA=;
        b=ZbCYzY6be59Bg43hL5uNdjU6UJGD9z0zzHo/JvJWn/Yt2DUNKa8+Syt6T3Q95ACwo7
         iZi6V/f0uJ8BzoUkRLpTdH7EM/DI77N4otpngBwcyRGUWHmqG1T8LIp9dzSCF07fuyD1
         w9DoRZl9W54g9yEzRtOgE4GvY4nad2KTzdi7Ev4R0HtF3a7LXl4w5J2Skk6zRsAMQ6YI
         EPy7pKf36T5Xm9LfsV7ICqjpN1OG9z9pjH1g+M95gRLE+MajM+oWET1e33JdCfAB4NEh
         PGEE+sYTK/04nP72Yw1F9RBDp8djioyKBY2613Tk4ofWxWoS9/9dC8nPfzL9QzZ3Lyip
         KxyA==
X-Forwarded-Encrypted: i=1; AJvYcCXB559dEDIR0vz2PAe6PN93USR908oOuk3iSYD5spOpgnkQihfuhbJeNv9uTCc9YVL3NfZtmKZKcJZEP28=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwP/Kp4PJqLIkCe7EsTzZ1R80k3slYPphbtbmQJY5tRlhv7XYMB
	/QBEcrihNaCo7ZNnfKtXs4XsQN2du/WllDH6FvvkXFQ+Wb9QmCHXNNe3rKBRmDs7cY/JUgBZCEv
	x+55F0VXJfOKkDmiJJkNnoEIRGR34L39vqrfeCi/7t19friNLteE5bE/Vj0RlbYT45xNPZwPQYC
	ZkwIJJfSobnLEo0qMK1+fG3j4i8lLvfIn1HWXj9g==
X-Gm-Gg: ASbGnctvDhces7buqOvN/LjWC3IMYhsYzVkPvZYWx1oVZ82tPde/EgyUPVRwwpe+N9O
	XJULchq3/RyQC3BTZdPqTg7bRfjZN3bxLhSVfFybCb0p2/jKTe4L9T7gCpULU2uqiod2X17MMTw
	==
X-Received: by 2002:a17:907:d58c:b0:ac3:c05d:3083 with SMTP id a640c23a62f3a-ac3f24d6f4cmr1790851066b.35.1742915359487;
        Tue, 25 Mar 2025 08:09:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExOgId1LbZrltLHsKUY+negeAOdt/Yk2MPT6GyUunWZ6asILy7XQaITr0IFU8wCmrZepcUKYZwGDue8tgRpLI=
X-Received: by 2002:a17:907:d58c:b0:ac3:c05d:3083 with SMTP id
 a640c23a62f3a-ac3f24d6f4cmr1790848166b.35.1742915359148; Tue, 25 Mar 2025
 08:09:19 -0700 (PDT)
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
In-Reply-To: <CAP4=nvQ23pcQQ+bf6ddVWXd4zAXfUTqQxDrimqhsrB-sBXL_ew@mail.gmail.com>
From: Tomas Glozar <tglozar@redhat.com>
Date: Tue, 25 Mar 2025 16:09:06 +0100
X-Gm-Features: AQ5f1Jrov1J0eHJ3t_FcdYu58nUqygB6AReV9HABcjx4wZEyM_z1SfPdGpJnZKI
Message-ID: <CAP4=nvTUWvnZvcBhn0dcUQueZNuOFY1XqTeU5N3FEjNmj4yHDA@mail.gmail.com>
Subject: Re: [linux-next-20250324]/tool/bpf/bpftool fails to complie on linux-next-20250324
To: Quentin Monnet <qmo@kernel.org>
Cc: Saket Kumar Bhaskar <skb99@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Hari Bathini <hbathini@linux.ibm.com>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	jkacur@redhat.com, lgoncalv@redhat.com, gmonaco@redhat.com, 
	williams@redhat.com, rostedt@goodmis.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NlhTr9zlghUseuOZW1LzapfqLA1P_sOdoV-Na7b9Q18_1742915359
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

=C3=BAt 25. 3. 2025 v 15:59 odes=C3=ADlatel Tomas Glozar <tglozar@redhat.co=
m> napsal:
> Shouldn't the selftests always test the in-tree bpftool instead of the
> system one? Let's say there is a stray BPFTOOL environmental variable.
> In that case, the tests will give incorrect, possibly false negative
> results, if the user is expecting selftests to test what is in the
> kernel tree. If it is intended to also be able to test with another
> version of bpftool, we can work around the problem by removing the
> BPFTOOL definition from tools/scripts/Makefile.include and exporting
> it from the rtla Makefiles instead, to make sure the feature tests see
> it. The problem with that is, obviously, that future users of the
> bpftool feature check would have to do the same, or they would always
> fail, unless the user sets BPFTOOL as an environment variable
> themselves.

Or the selftests and other users could use another variable, like
BPFTOOL_TEST or BPFTOOL_INTERNAL. Not sure what you BPF folks think
about that. I believe assuming BPFTOOL refers to the system bpftool
(just like it does for all the other tools) is quite reasonable.

Tomas



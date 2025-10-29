Return-Path: <linuxppc-dev+bounces-13477-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7EEC177BB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 01:10:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cx71d1w1Dz303y;
	Wed, 29 Oct 2025 11:10:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1029"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761696645;
	cv=none; b=BZAtjhbzC/whur5PFlFXPTXpJA8I1WNzDDTmT7g1fNi49BK0aKWTzyzkn/pc0WFrQCUFOtWaIKTvHL2JnRC5QaNSlYQKBYAx2N7b86AuvXIVzUKhJn1YnPh8l52iEsPrwxLenC0OtpiOLrGEJaiAlUdgLJtBg9nblUHQhzzOSA6OAuglKVcGjJfshy9cQ7sVpoDu4O0inrEpRpT6vODIBmL8war4K1VIvknQNHHtiI7kckq6IoXkl8nvURHd4z/nKnKo5hatq0c+iVY2G0gfAYBjgi1o+JMDcjo3ukHXnMXR3xxB4Wj0Qb6gtxKZFhM7qqzgo0N8q9TBBxRAEETSAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761696645; c=relaxed/relaxed;
	bh=OAeYT3sIf5J+urxpWRZdGCYWbbcmjWbjfXki2vhXqBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n5SX23oz5xJjuxA/mRYnbMOniPdFrOt9tpXbQEve4VzLX3JO1N8HRd/iciBnxWGYH03TGv5r9SlqW4GuxPd2ddwoRhL5A2gdq4YSlO99ROnfsJTFucfsmYv8ErwTZndxpFqg/OB2CQSOjGJBAXouxERGEWf1fDi3gF46FJdDbuG8xixwv4V0T3I73xVrmR2d29Xt0lfC0MuyYIL+b9OsT4oI0FEH4ffc5mmIZTldracaW1BtZa7J3U5+ydWcdLAZX5yAKX+OGMYVNF9RMIGBYyXMNu8bZI9QmiYA2ke6dIuN0tGH80RRZzgLD/OunvL4+vwgfap6BoHeoRwfKzfXfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=QH/Nh+ps; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org) smtp.mailfrom=paul-moore.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=QH/Nh+ps;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=paul-moore.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cx71c3Ndjz2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 11:10:43 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-33db8fde85cso6786464a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 17:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1761696642; x=1762301442; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAeYT3sIf5J+urxpWRZdGCYWbbcmjWbjfXki2vhXqBo=;
        b=QH/Nh+pszx1XTzjW30IxrEWE4QumyOeTBjTtgcAMEGI/1IM1PzzXssMdCnYIBdT7QI
         WobNistDsxztyWvVkLA25uH3pJIS0pdDQF6Wu/+vuuXI3SL3D6jHIvcVJTHgNCrx/+wD
         AC5BkJtWq+T6DYUKXtCCt6CkE7U0QY/Co97zZWSHEYj0ZEdAMbQ4To5JYPBb/7acbtuN
         Sa6oZpemwdUzHEPKOujlBchcgaT6DZktCPPCJh2zNFISaWIlrBWKaYiwwMf5VQH8s72k
         UC4J/t3V9UmV+4CnSp01HjLarAbYmouM8xAtl42/Mrr5WYRHjhkeLhzuvE7u4aKP6U+w
         ytEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761696642; x=1762301442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OAeYT3sIf5J+urxpWRZdGCYWbbcmjWbjfXki2vhXqBo=;
        b=j8GxNtlzJHfyxJ0fgEeg/2wQDbppfDYL35IGyRm5bAewp3ypLoeQhk8Eu3VUQrCUy8
         t4FtdpdhvYOgnEkdWcmmJV1FFHVdNkZuzmurQSTcaWx+h2WH8VeDgNdFvgqsXokJsZvc
         7vZQUDnWMWWdHvkmHqzuxqhpSPRxmdR/KS9RBlzcCuHUF47ONCvLK51v6lUwGYi9LP3u
         i8dGnsbC8gR6tB/rmlW6ZN+Di6nGiyLNyyaRu/VvupEaJjpU+qmIDVrqiVZb62SeCB1K
         g33F4uL6CaKuS/UV/2rgnhiA/D5PD9Sz4OZAI19vxRLFoIXiLuoXpb33WgDyFz9NDYq8
         C8vQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHJPph5HydaWu2pQrGzdIiF750mtAyQMOI6bQjTWYAwQwDYvHQvRx7AChOG78K7R3bMkUevH2Xf51jTFY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxrjSy26/wjM26t+HWDEYWGcBDgDJBHMWAlcI2TrX3r1RoBCa87
	vUMrWkvOOm+Zjv5VeOiV/wW16dZYz1Hg8YhTXLpq+wBesatPUDSSTiJEiFPZEAnvSK9YUk1N033
	DxXWXY0TfkJCbP0S+yCIjLQzhvl1TqKq7I5Pg2jlC
X-Gm-Gg: ASbGncuizbNeGIlGSY9YMHbOZBP1QN2rvgxko6gBEA8eKHmqWQL3jP1olK79sNocWFz
	MEwpq7WxmTVACU2yHeQKA5Hu0hkIEp5RAiAVxXh+9TlEUcATtPzgPjgYFy5YQE87cG5bSyNVRgO
	uj8ao/E65xLDCokjtaSrqddK0/P5ZqOyEZcks1O+Pvq+NpS80gc/GqcWpa56YzdDkBhEnWfL50L
	9BcOjxVeBYNeBOUmZJfInCNpiCAjpEJtQya48l+77W02/85GlnLbesCihhR
X-Google-Smtp-Source: AGHT+IGhjs8q4GiygXwr6DCqhQXMqWhNs5oaPfnq5KAn4id0agHe+xmdqRLWlZPNOFZ/N+dUgAnaM8QQHq+RXzkh3rE=
X-Received: by 2002:a17:90b:4c8c:b0:32e:d600:4fdb with SMTP id
 98e67ed59e1d1-3403a2a1014mr987268a91.18.1761696641654; Tue, 28 Oct 2025
 17:10:41 -0700 (PDT)
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
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk> <20251028004614.393374-49-viro@zeniv.linux.org.uk>
In-Reply-To: <20251028004614.393374-49-viro@zeniv.linux.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 Oct 2025 20:10:29 -0400
X-Gm-Features: AWmQ_bnyVa46lrJnSEC4p7b8a6-fhgKBPo6xvMl8XVNnPJL6uMjYjs2dxSO45Ps
Message-ID: <CAHC9VhRX6kqFbbKuOoKOLLve6c+7TN3=fXHrtXyj=osfNYd+2A@mail.gmail.com>
Subject: Re: [PATCH v2 48/50] convert securityfs
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org, 
	brauner@kernel.org, jack@suse.cz, raven@themaw.net, miklos@szeredi.hu, 
	neil@brown.name, a.hindborg@kernel.org, linux-mm@kvack.org, 
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, kees@kernel.org, 
	rostedt@goodmis.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Oct 27, 2025 at 8:46=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> w=
rote:
>
> securityfs uses simple_recursive_removal(), but does not bother to mark
> dentries persistent.  This is the only place where it still happens; get
> rid of that irregularity.
>
> * use simple_{start,done}_creating() and d_make_persitent(); kill_litter_=
super()
> use was already gone, since we empty the filesystem instance before it ge=
ts
> shut down.
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
>  security/inode.c | 33 ++++++++++++---------------------
>  1 file changed, 12 insertions(+), 21 deletions(-)

Much cleaner now.

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com


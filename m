Return-Path: <linuxppc-dev+bounces-81-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B17B495197F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2024 12:57:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jBVonLtX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WkQFG2fDjz2yNJ;
	Wed, 14 Aug 2024 20:57:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jBVonLtX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkPV40SDpz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 20:23:22 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1fc60c3ead4so43724825ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 03:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723630998; x=1724235798; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HVj+8U5cjU9NMpbUhVAqZfiyxBdpITYlkXwG2knZFI=;
        b=jBVonLtXpJm1V3xsUKSz5y83eA69qU5Z+2xLX+7tjwXuxxEkCt6ZbxyVZ4zA08cup/
         aepa4I9C602pSMgVrtxj7KPCsgmSoct9odm1ZTYpPKlfZi/1lgCnYdYYWr1qO58cIpsa
         bR9dHt2bZUrj53QbT7Bi1Py021kJXAAVCDkCUdZ6bslZR61JTplK29EIGRd9SjK1KEjY
         XbgUi+jAPsncmFY+FDUgObgfGelKeLlWAXutXO2LVZIUoxohMoedZ8e8xU3XpOmtXVEa
         Pz1FHHKWCXhZ7Eek49hhpH2oEDSx0vPDrocp8Axl5fcMJ6FBLzgWtjpjhv3u+XhxPXM+
         EIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723630998; x=1724235798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HVj+8U5cjU9NMpbUhVAqZfiyxBdpITYlkXwG2knZFI=;
        b=RCHoaZVVFtsIaSBRoeTc8o30wKWlpZWKkylpilxuSSEJTg+sa0BIo+8q/3CDC/RhrZ
         z0B5Ja4Sw9YkBQGesIHEd76M2SFvtqE/iX95pOGS4QpMytvSgOn4ZvSs0hOozsi9P8TS
         Zy6rv+jUqHG74uX1EUqwGPA5UFKBdKH3/Si0bG4Bk47TtBmxes6jHw91H+yI/FlkTMDe
         2v2pYSsC8DDQJ2FkoRoWtC9l/keS84VoPAy9ccemcyXYkNs3G/Y8E26+6CZx6wLjCoWK
         qJ3dJHbp8uuhXfZNJzPiO8EiH/PsH2YXcoeJVFS0wrCM82DwvHx5yeQiuQbFu3N2B09T
         jUSA==
X-Forwarded-Encrypted: i=1; AJvYcCVLJs7eNoTgstraGMslUa6EpslnsKMRWqVR0h1izPZS03viW0X3MJasjltKt0GEUczvlTFNbWxBoTdgNxx1RG3yQFrwFnvspM28JNo5fA==
X-Gm-Message-State: AOJu0YwusLDjb7k4updmkteYLuPLR5+Rfmev0T4RcxRE6z6qeQSsERBF
	VqFlby6grbXelTNFwnf17zZ1fE4uwethXZw6qP+yD7/CzrachYyxlnAB0p6AQvU9Btjo5sqY7s0
	QTwVMAkrIrHqnSQEjkuAtx0J0nds=
X-Google-Smtp-Source: AGHT+IEFmAzQLOVuqUtZLJQGgivh7HM6JFKYI9do8KEkaRpnDapHrr8RKH0xjTjTQViZeviXPgYS6Cj7iPfkQfN4yxg=
X-Received: by 2002:a17:90a:130c:b0:2c4:dc63:96d7 with SMTP id
 98e67ed59e1d1-2d3aab7bba9mr2409155a91.41.1723630997931; Wed, 14 Aug 2024
 03:23:17 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240814100939.647305-1-maddy@linux.ibm.com>
In-Reply-To: <20240814100939.647305-1-maddy@linux.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Aug 2024 12:23:04 +0200
Message-ID: <CANiq72=j3Ui_2YTsBUnvg8APJtDbuMRwvzpnDvToeMa98-pNxQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc/xmon: Fix tmpstr length check in scanhex
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, 
	naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 12:10=E2=80=AFPM Madhavan Srinivasan
<maddy@linux.ibm.com> wrote:
>
> Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> Link - https://lore.kernel.org/linuxppc-dev/87ilc8ym6v.fsf@mail.lhotse/

Thanks for fixing this!

The "Link -" should be a tag, i.e. "Link:". And, in this case, since
it was a report, I think it should be a "Closes:" instead, and thus it
should be put below the "Reported-by:" and it should point to the
message of the original report, i.e.

    https://lore.kernel.org/linuxppc-dev/CANiq72=3DQeTgtZL4k9=3D4CJP6C_Hv=
=3Drh3fsn3B9S3KFoPXkyWk3w@mail.gmail.com/

I am not sure if a "Fixes:" tag would apply here, though.

Cheers,
Miguel


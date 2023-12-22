Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 258EB81C79D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 10:52:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NKABxWyk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SxMzr5r7pz3d95
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 20:52:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NKABxWyk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SxMz06kXLz3c3H
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 20:52:12 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d3ef33e68dso12213045ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 01:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703238730; x=1703843530; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/oGzqKbAgpu4zySBC+7kLRFWSum1+ZYKYmLtZ1Yu6Nk=;
        b=NKABxWykWwAC7qMyjNaSiJ+FyziBXKZGtbwT4qSDgb/GIATTQLSFKx3yeEOshApkLC
         S7webG2dR7IjipfhkgISn42iJjfIv7QVDE8ADuZS5UKd7iDSI5udiCLyZNajeCCIJoYm
         S5gjEs2v+re1yeQmeph4lqgEPQKSBzRVdr6K0OGUM9LU7NPVEDUVBoN9j/x8nE6N/i8J
         EiW+ugKQ2+wPUqAqyVw613hg+ziu1Oxi5039iHfARXVMM7rXbRbrO2MzsVF9Oo+Hz0Fv
         oDNZbj/8Wykg7NVkR0stYU7hZRYBfc0nUNnicWV7cWQMwmrHV9dd0zdMnVbF4U5TQmVl
         4hoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703238730; x=1703843530;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/oGzqKbAgpu4zySBC+7kLRFWSum1+ZYKYmLtZ1Yu6Nk=;
        b=Dv2MHabiR8FDippHwc6aPL6VpFCwcOzbFa7V9v1H7He5KCatxYdLCKpzzWVS/z0mF1
         JuwrRaqqVxl469ruPmL6AIoBiaWZv0yCga/42Aupj+09hGBvLcasmN2UgR7CM/h0TPKl
         TYzVVPGRTZR9vX7eZwCQDJA95JJjwpfbHiqAGSbA3caU2CR/wjQeZ1LB5Q8QtVMMCFSM
         rozn43k6dXDttMO4l2XQp8XoQPbXh1VUkHArs52k+cAVwq3fkYFMmr2E5WXG0/mI4swa
         zuZ7QQXUoO7OWPq3kd/jNB2uz+f2zFeTaZKw0ygLZe0qlj2/Abbo3f53YrXeiofq1/GT
         ZK4A==
X-Gm-Message-State: AOJu0YwCcxlVUn34Be8T2B7/6qcXXt0Ck8RvGj47OmmXNBf1vBhqZYHR
	/Hz+CVYsXTnhFsG7r/ANUg0=
X-Google-Smtp-Source: AGHT+IFhx3xO2W0ciK9SRJbTwz9Gf645xzxvDZynI5z/OnmVKHMCSfWHi71FKgmV4f8xxVHmz4B7cA==
X-Received: by 2002:a17:902:d54f:b0:1d4:cae:99f9 with SMTP id z15-20020a170902d54f00b001d40cae99f9mr1594572plf.45.1703238729951;
        Fri, 22 Dec 2023 01:52:09 -0800 (PST)
Received: from localhost ([203.220.145.68])
        by smtp.gmail.com with ESMTPSA id x2-20020a170902ea8200b001d1d6f6b67dsm3052737plb.147.2023.12.22.01.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Dec 2023 01:52:09 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Dec 2023 19:52:04 +1000
Message-Id: <CXURQJVKGNET.OGA1CKMUBD42@wheely>
Subject: Re: [kvm-unit-tests PATCH v5 13/29] powerpc: Make interrupt handler
 error more readable
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>, <kvm@vger.kernel.org>
X-Mailer: aerc 0.15.2
References: <20231216134257.1743345-1-npiggin@gmail.com>
 <20231216134257.1743345-14-npiggin@gmail.com>
 <4a42b65c-f65b-41cf-91f6-eeb96519dc2c@redhat.com>
In-Reply-To: <4a42b65c-f65b-41cf-91f6-eeb96519dc2c@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Dec 19, 2023 at 9:53 PM AEST, Thomas Huth wrote:
> On 16/12/2023 14.42, Nicholas Piggin wrote:
> > Installing the same handler twice reports a shifted trap vector
> > address which is hard to decipher. Print the unshifed address.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   lib/powerpc/processor.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
> > index aaf45b68..b4cd5b4c 100644
> > --- a/lib/powerpc/processor.c
> > +++ b/lib/powerpc/processor.c
> > @@ -26,7 +26,7 @@ void handle_exception(int trap, void (*func)(struct p=
t_regs *, void *),
> >   	trap >>=3D 8;
>
> You only change this to >>=3D 5 in the next patch...
>
> >   	if (func && handlers[trap].func) {
> > -		printf("exception handler installed twice %#x\n", trap);
> > +		printf("exception handler installed twice %#x\n", trap << 5);
>
> ... so I think you should move this patch here after the next one.

Paper bag for me.

Thanks,
Nick

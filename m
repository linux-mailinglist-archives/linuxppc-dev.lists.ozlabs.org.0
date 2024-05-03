Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3787D8BB474
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 22:00:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dC3Esp0c;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cnNTKPVv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWM9m6BsSz3dkm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 06:00:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dC3Esp0c;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cnNTKPVv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsavitz@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWM9015Xkz3ckN
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 06:00:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714766397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sUTF5ozfojoSJuPIPVB/o8L+t4pbL1ydu6RylcxUyuQ=;
	b=dC3Esp0c6w9ajDQNNp8yRFeAUUuyAPRSfNWbSWjCNljkQTh5Id3ffbFalm7+msxuqMaDcr
	lc6gBHsiqvwrJryInWsDTXv8aooMn7CqXtezdkRJgpA38h6pjjMyfBS9gXG5yeii1SNRit
	pQzFo/upGbep4nLa8pxozpo6wCM2/fQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714766398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sUTF5ozfojoSJuPIPVB/o8L+t4pbL1ydu6RylcxUyuQ=;
	b=cnNTKPVvtt8qx7mdbP3V2wxoWQ49qFN1CzZS5V4NPwFXdu5tLLV5hkPZvd+MXh1h1E4Xbe
	hhtx0LKGh9XiTdWfBBLyL6v4mAOBYNIsoamWTIBD1K3b8rzCkMaTlOM+uxo3tdEEm4TtbJ
	B5nsd3lD4idvT+twOk4SqdfZBT4UCq4=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153--ySykv4nP5K1tv73Ikqj3Q-1; Fri, 03 May 2024 15:59:55 -0400
X-MC-Unique: -ySykv4nP5K1tv73Ikqj3Q-1
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-4df20a887beso48296e0c.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 May 2024 12:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714766395; x=1715371195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUTF5ozfojoSJuPIPVB/o8L+t4pbL1ydu6RylcxUyuQ=;
        b=vFEcRXrN+wBVCZT3ZFqxToKY7T4YpYaiSkftbbStq4/AlsiiQ9vlDKRkhqKk1n1IA9
         bIpwX9oNGZa2qxTbRFc76o7aY+78TOL9fpGnVEKQjVPPe6rXhRy3LiFjc0JXPEL/ppsH
         /ysgMFfQ+3LHf77ENCr4+ce9w59j+PkQ4cB65FgX4RgalVGVX92s/zUcRqItQ5730OR5
         h3nXcaI7Cfv1Bmfv6z73NSvOHC1tcfNyIONgwQYMhg4ddoRiVqKkqPw23wkkyoTrApR5
         /wNrv/0tH/IUC/Ow6owqx6zcCpQ5cr04l1BqM8Hy0VoYCNIAre6HRfu3EBQiecM3/+pt
         EGcA==
X-Forwarded-Encrypted: i=1; AJvYcCUrZmc3SJbpzGdpo79c516bUUNy16H2c2t+X7n9Tj2QYewiwsWfAXPcmZnNg5KgB/C6JDYpcSZdcPXkuP6ujQid9YTMxEE3xFduzMuBtw==
X-Gm-Message-State: AOJu0YyViUxJ7K3vvOvaFOAg4fA9ZBQN8J/p/fCuyxIkoNcfi/21FWXR
	Rj1v7CffoqXsuWRaa5SoJeqAYxQeoA0M8HdUVGMzozrXT4tdgHotvLJVcLJaQ6OYyrwoi/sD3Sc
	mD7m7tOGjMVQ3E411FSa9VwJCD9NPRXP1HUn/nIqkg1Aj2y8hYvX2XKQyu8TV5UOYPWLc2RHcPJ
	UKNxWh9SF8yNo+CcKhJA6nhrfGQG9FOM/9UxsqSQ==
X-Received: by 2002:a05:6122:4a16:b0:4df:2ce2:6e4 with SMTP id ez22-20020a0561224a1600b004df2ce206e4mr2302859vkb.4.1714766395343;
        Fri, 03 May 2024 12:59:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtF36t68YBMxMVQTeu3aiyANAwgE7VTaR/kru2zfyItYBUnQlHXYZVIl46ZGQlXL5hfHqms2dpIPNZYXvQZ70=
X-Received: by 2002:a05:6122:4a16:b0:4df:2ce2:6e4 with SMTP id
 ez22-20020a0561224a1600b004df2ce206e4mr2302841vkb.4.1714766395073; Fri, 03
 May 2024 12:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240403083611.172833-1-aneesh.kumar@kernel.org>
 <20240417143631.253489-1-jsavitz@redhat.com> <CAL1p7m65qzeQ-RsOiQ1X737mr2xr9WYn1g0Wn_nKAzx55jD=Ag@mail.gmail.com>
 <87fruz3aby.fsf@mail.lhotse>
In-Reply-To: <87fruz3aby.fsf@mail.lhotse>
From: Joel Savitz <jsavitz@redhat.com>
Date: Fri, 3 May 2024 15:59:39 -0400
Message-ID: <CAL1p7m6mj_mbYpRoMmwy1xAqhKxgeLG5fBFB+SSVvHHZWe=+TQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] powerpc/mm: Align memory_limit value specified using
 mem= kernel parameter
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: aneesh.kumar@kernel.org, linuxppc-dev@lists.ozlabs.org, naveen@kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 2, 2024 at 10:20=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
>
> Joel Savitz <jsavitz@redhat.com> writes:
> > On Wed, Apr 17, 2024 at 10:36=E2=80=AFAM Joel Savitz <jsavitz@redhat.co=
m> wrote:
> >>
> >> Acked-by: Joel Savitz <jsavitz@redhat.com>
> >>
> >
> > Hi,
> >
> > What is the status of this? This patch fixes a bug where a powerpc
> > machine hangs at boot when passed an unaligned value in the mem=3D
> > kernel parameter.
>
> It's in linux-next for v6.10
>
> cheers
>

Thanks!

Best,
Joel Savitz


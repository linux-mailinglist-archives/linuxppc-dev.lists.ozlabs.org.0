Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 309188BA109
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2024 21:21:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GUoTu4Cb;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TZUZO4ea;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVkMD5tl9z3cgW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 05:21:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GUoTu4Cb;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TZUZO4ea;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsavitz@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VVkLR4VMYz3cVq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 05:21:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714677656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YN35LCw+EwcOnzFNEPvKWAuVsk1KmHVWqKO6ujXSy4g=;
	b=GUoTu4CbpSzTdU32gOKeG6vKyZnOUJma1oGVkXBi+4f6G9fN3JMPbkJit9T6SCgub1YIZG
	rj6anWjJxgt/WSY3VpHG0gGZghXAdtsYg88LswIrDCFLAX5coWjsp4EaGWQ3ZVs+mTxvRh
	CQndmgrT9KFhGvzkq6nE0dShG4uAwGw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714677657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YN35LCw+EwcOnzFNEPvKWAuVsk1KmHVWqKO6ujXSy4g=;
	b=TZUZO4eaVUvt1NY47YDxMylCj5D8N12lt6Ybn1ROcxHC7AzfTqIfUBOmSKWt7LwTJBApwY
	PGfWsG3b0CS+4nAIwA3rxeoDCmWeEPaUUA4DJu1O940tu0A/moG+Mq3ejuufl5MlwRHNe3
	Loaa8lrrscZQWGR1DE7ypEdHZDTT+uM=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-m9Oe2Cy-OBSFVIYpUyCOdA-1; Thu, 02 May 2024 15:20:54 -0400
X-MC-Unique: m9Oe2Cy-OBSFVIYpUyCOdA-1
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-4df1afdf668so435650e0c.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 May 2024 12:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714677653; x=1715282453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YN35LCw+EwcOnzFNEPvKWAuVsk1KmHVWqKO6ujXSy4g=;
        b=wugCKyOOIMcSXsz/1ko3eRqLxsYE4xwQx9Jn1wCM3nyC66/nxY0EQurW3nu5SODsBp
         72zx5J2PWvbCDitplK4uPMqBZSxYne6LLgdKpf0UpjbrCARM/2rig7/CXkgEhGDDRn3m
         P1tL7a8DPXAHIbGw/mxzd50xShKdqnqLXXRoQU4j8FrAJ1GOF9gGK3iOYMPsHOolboG+
         T0eD3vgT+T8VKaqAl4LAcrxnJIFqG5CMrzKdHj4rpbA/ZDKu3OmWndIapksBv662XtFJ
         KEbUiKQuwX0LKmj7YytTEuS+5jLQprKA3aQKyUdszoG30mlw54gxsYPFJbLjxGtq3RPl
         fr9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV83hf9XrvQ+8U8ffcIZaOMwb7pXjfjwgNcXq0WG2oTL88cjqdgE87Uon10wKNiT7fn17ZAOCLfCE6XC+rCD0nOPKRUCHPjF2myn8vzFA==
X-Gm-Message-State: AOJu0YxLopgsIyYOmLNcN4/CrG0DZE8prRqfL2vlytpqxENZgzt12qxS
	js4mwEW8mCZLE6mgDhHFuCWmqTWez0f08vmE7M0rziPzUHU4YjvUsp7e3OOfP2G26fCrErW4+CL
	pmF4BGIUA+4v2JcUDBu4OTOrrqM38uv6n+D3+EuP9VyT+WZw2l54ddNYEcwygo/3qJaSpW9zv+c
	BRE8Eda7EP4fsCZghQGBKoyyxEawS+c5fXrAcFwg==
X-Received: by 2002:a05:6122:3114:b0:4d4:1ec7:76e5 with SMTP id cg20-20020a056122311400b004d41ec776e5mr604507vkb.16.1714677653444;
        Thu, 02 May 2024 12:20:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBCZ6LugHPYFOupqA2nr9XRPmkVcyShDvH/75rcHAqHj7WkKQj5Eg0ZoDf1CGwID+J2HLdUCm9V39qTsWX7XY=
X-Received: by 2002:a05:6122:3114:b0:4d4:1ec7:76e5 with SMTP id
 cg20-20020a056122311400b004d41ec776e5mr604480vkb.16.1714677652914; Thu, 02
 May 2024 12:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240403083611.172833-1-aneesh.kumar@kernel.org> <20240417143631.253489-1-jsavitz@redhat.com>
In-Reply-To: <20240417143631.253489-1-jsavitz@redhat.com>
From: Joel Savitz <jsavitz@redhat.com>
Date: Thu, 2 May 2024 15:20:36 -0400
Message-ID: <CAL1p7m65qzeQ-RsOiQ1X737mr2xr9WYn1g0Wn_nKAzx55jD=Ag@mail.gmail.com>
Subject: Re: [PATCH 1/3] powerpc/mm: Align memory_limit value specified using
 mem= kernel parameter
To: aneesh.kumar@kernel.org
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
Cc: linuxppc-dev@lists.ozlabs.org, naveen@kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 17, 2024 at 10:36=E2=80=AFAM Joel Savitz <jsavitz@redhat.com> w=
rote:
>
> Acked-by: Joel Savitz <jsavitz@redhat.com>
>

Hi,

What is the status of this? This patch fixes a bug where a powerpc
machine hangs at boot when passed an unaligned value in the mem=3D
kernel parameter.
Best,
Joel Savitz


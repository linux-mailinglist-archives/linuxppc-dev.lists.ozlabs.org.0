Return-Path: <linuxppc-dev+bounces-4767-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87063A03E23
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 12:46:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YS8Q80FNzz3bNh;
	Tue,  7 Jan 2025 22:46:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736250367;
	cv=none; b=KsdV9DuZKq/1/PqjSgthWTreyQHHNeID5e3yIDFRW2WDuC1TgourSlXanmQdak9QUDASeg+TAkryQciQV9LfuoYaF/xdWYszPsWh/he/FVXzdBi7G3fXZoNIi5WalRF8N7ZaoHx+nD+kM2ZClOOadAiQ03sNB97c4b4/bOdSDYpRO3glw8RCsrOhOTpmyOoWhODu5CYxJjUU/MjAhKYUrq8bKEzMhZxnKNgkl9dcbH12EMhEQqDmxH4BkvHysQwSHWlxyeVI7meRGd7ydOLPw20A74yDajZOYcCxDHlmz3EKnbjSUjufVh9N8mANA5UzkxZ8U8iNW4tuyUEj38o/mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736250367; c=relaxed/relaxed;
	bh=lD4QOrzRsNYasrC3n0IGBLoyR09ALTVeCEEVYB2IkKs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SvJgpalVuNdeWczJSYfOA07PVMR+o5To4mp79oxrIP1jxoJQNFXzYvsxgjiH/2g6Tue7l0NuhLoxqrWywr4TyLFurLUvDKPLSbE18nOkG3ZWDo+YuZAiGsQ4/g4W4wppaP+OyaPZv/Qzs0cSn5vtBI9TSkbvm1JfP0jXB614uMLWodmDWdSciZwkdRFeG5LNLJWSMBFFUmJKBQF4zp+U+gyvEMvqiQ7si8XU0zNzAhlX3sfxlyOZ7Jkr8lGLAHT72bvPy68/lt1EtcSBWNzUrYE2AtkSIgFCuUnmocneKVCHQT3p7JXxkcevMZwUorbX9/MCqgFQRA7TcJzvfT1qOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HlVTr3ne; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HlVTr3ne; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HlVTr3ne;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HlVTr3ne;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YS8Q26WQTz30dx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 22:46:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736250358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lD4QOrzRsNYasrC3n0IGBLoyR09ALTVeCEEVYB2IkKs=;
	b=HlVTr3nezH0dPl7fI5GqOpsWFrbd0HDyZAIqherP+ZrmFOSDxZqYjEoWkvz77GsPQiu2cB
	THgnmxKlc9TVzL1br16JOOVUCRVqK0c84feUQyry/OlbkZxuGHD5srXC6/H7uuCvcVqPdA
	TU5x2mI/oxqhwYobYf4M0G3mWtOimWE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736250358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lD4QOrzRsNYasrC3n0IGBLoyR09ALTVeCEEVYB2IkKs=;
	b=HlVTr3nezH0dPl7fI5GqOpsWFrbd0HDyZAIqherP+ZrmFOSDxZqYjEoWkvz77GsPQiu2cB
	THgnmxKlc9TVzL1br16JOOVUCRVqK0c84feUQyry/OlbkZxuGHD5srXC6/H7uuCvcVqPdA
	TU5x2mI/oxqhwYobYf4M0G3mWtOimWE=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-q0iHneRzOhGOOGEWZ4mc4Q-1; Tue, 07 Jan 2025 06:45:57 -0500
X-MC-Unique: q0iHneRzOhGOOGEWZ4mc4Q-1
X-Mimecast-MFC-AGG-ID: q0iHneRzOhGOOGEWZ4mc4Q
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-84cd123df74so13299039f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 03:45:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736250356; x=1736855156;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lD4QOrzRsNYasrC3n0IGBLoyR09ALTVeCEEVYB2IkKs=;
        b=ImHnwelsMrQ06XXNsvzYjKp+aM2OMG9acVZbeo1ykVNnFSlTGlUv9afQvlJShUqgc7
         WO24ZsI3Ea9kj8nkM653UaTJpj7Whr84VkM4xkG4ga60pfvvBzSoxdmViC8PZ0CmUuHI
         4XI0CNpSqzHVJ2GFM+d8PBJxasb+ZwcM/qPoxsZbHIDPMsfQyA1B1ZTSfUqZJPlj2QDh
         8P4Bv1VnYy4ubN+iTb1K2wFFnJ5vQVpm/IOIJ2z4wdwksMRQO23nxoR20hdY40qy75UO
         QbFdN2Htd+tX+C9B4WTwQyi8Tw0X0Omtf+kxyGBiGwSnYukUnOArXFzakZSHPML2siSs
         hDNg==
X-Forwarded-Encrypted: i=1; AJvYcCVASNWwLjovdt9pPBnST1rhf0opbOU61KV4ZbN3XnVtecxusH49AfSqSeya5ctrPYJAEtFqHVioHe8zT3Q=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwbzpIuzHyYYTvmszy+JKffRdhzwl7JoABd+hql1UK2zJDtq+PP
	q//YPwek3C8YK1oWz7CUm8g4ZOKaT7l/ZAYoQ/6m9ULrKH6BK5gapIYPC4P0PGwbDYkeAOR7vMJ
	H0AMr1njWJDaa5MlCXWKGU+KdJcfi/LfkOiV4RO1zOE/hInacZqmz0aTXUk0pRKw=
X-Gm-Gg: ASbGncvsSkCw/10oL6pM1Y1Bk8g3pHk3HM2pnodcl6qA8eecL8J4CyWNXuh+S7v/tF5
	eTecJjBcPTU4NMUc9zisKHYyJcxS8lb4489yiqweReocAQOtTKqS5Ton4iIUUbqYsANUyW9SMzZ
	hoy85UIwOL/kPxBW3hqhh6ZBx+PVhgYWT6CW2E1hTQeWSPTvS2K8islsO3IromN2W8eq3wXyNMc
	7Z1YEss8bM5wXnOgJ+XatplhIcWiXPvmPCUORBE+OexNTBhO9UdA6p4YQp8
X-Received: by 2002:a05:6e02:1a04:b0:3a7:bfc6:be with SMTP id e9e14a558f8ab-3c2d5d2a628mr137550075ab.5.1736250356589;
        Tue, 07 Jan 2025 03:45:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWHXMEgPhkbbicAC9Ldxi95MuYLoSCuQgZJMCqfPjHvdiB3LeWRroJcOAXhLJIgad1B6jH/g==
X-Received: by 2002:a05:6e02:1a04:b0:3a7:bfc6:be with SMTP id e9e14a558f8ab-3c2d5d2a628mr137550025ab.5.1736250356217;
        Tue, 07 Jan 2025 03:45:56 -0800 (PST)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ce2d260971sm6225975ab.79.2025.01.07.03.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 03:45:55 -0800 (PST)
Date: Tue, 7 Jan 2025 06:45:50 -0500
From: Alex Williamson <alex.williamson@redhat.com>
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Timothy Pearson
 <tpearson@raptorengineering.com>
Subject: Re: Raptor Engineering dedicating resources to KVM on PowerNV + KVM
 CI/CD
Message-ID: <20250107064550.713c2fd9.alex.williamson@redhat.com>
In-Reply-To: <8dd4546a-bb03-4727-a8c1-02a26301d1ad@raptorengineering.com>
References: <8dd4546a-bb03-4727-a8c1-02a26301d1ad@raptorengineering.com>
Organization: Red Hat
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cIECIzlcUD9xV_zY5N1Qq_sRo0gSCd-RL6ewBYynAfk_1736250356
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 6 Jan 2025 13:47:50 -0600
Shawn Anastasio <sanastasio@raptorengineering.com> wrote:

> Hi all,
> 
> Just wanted to check in and let the community know that Raptor
> Engineering will be officially dedicating development resources towards
> maintaining, developing, and testing the existing Linux KVM facilities
> for PowerNV machines.
> 
> To this end, we have developed a publicly-accessible CI/CD system[1]
> that performs bi-hourly automated KVM smoke tests on PowerNV, as well as
> some more advanced tests involving PCIe passthrough of various graphics
> cards through VFIO on a POWER9/PowerNV system. Access can also be
> provided upon request to any kernel developers that wish to use the test
> system for development/testing against their own trees.
> 
> If anybody has any questions about the test system, or any insights
> about outstanding work items regarding KVM on PowerNV that might need
> attention, please feel free to reach out.

Hi,

What are you supposing the value to the community is for a CI pipeline
that always fails?  Are you hoping the community will address the
failing tests or monitor the failures to try to make them not become
worse?

I would imagine that CI against key developer branches or linux-next
would be more useful than finding problems after we've merged with
mainline, but it's not clear there's any useful baseline here to
monitor for regressions.  Thanks,

Alex

> [1]
> https://gitlab.raptorengineering.com/raptor-engineering-public/kernel/kernel-developers-ci-cd-access/linux/-/pipelines/1075



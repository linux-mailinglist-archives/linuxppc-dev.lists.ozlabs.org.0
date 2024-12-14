Return-Path: <linuxppc-dev+bounces-4128-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F33529F1E4C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2024 12:36:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y9PKm3tQBz2yMX;
	Sat, 14 Dec 2024 22:36:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::532"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734176172;
	cv=none; b=R79LSyWfTm/vkWIfSVuIXaWh3TGestkw6LkCgstVHxQzny96nktiA4wuF0zMYzV5HoSIGhOlOzblFZgZC3pTL+JRj6Hovd21/IPFMSwEvVWj9lYDvq/tdRPJphS+qTS+0AJ+Plw3LQzRZquAWtVgk5Q+Z+e/y5d28jM1yPUtKAhvUtv4e60iwWnpfBKXRS6MoTRXEX1cJ68oBRaIJV4V9X7iBMkBxyVUQG/C986o6YaFmkvPoPUcS/gHqUspdSkeKm39/DuQZjziTNAsjh/lQEMEh/5DITu9hUBDXr0Wf6tIoRs+g3TR6HLi/4w7Jj7MqDnNQ0u4yCTX0l17jPrFFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734176172; c=relaxed/relaxed;
	bh=NgMsVx6LalBM3WCUrF4IRtnX3JNL264uu8F1CqpXfck=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=eEno97DoEn3mvJSXvVCeCN43MstuRzr8+HrYe/zfJ2JfgxpR+KKowojM9n41Jmo500S7JOfix1qRlucLIMu12pbEzogAO1hoOAwcY8hs3mXMMCjzq6cCzt1Ckuckv1vIlsCheFAtQMmfGbABKYqiuKBeZpwnCAHlyyIk3r18PEkPDNzDzgApk1KZnSemHLACBFxeAhirRShKv6KL1jXraQXjIJuPF4AFbg5sTowUODvb77082Vh+ZbsZ4QVFnuth33zeqwMDKYCQd/LkZqjFnC/AwGvWTHBJN0W1pAQxaG6NW/v2JNKDI7nv20pmoWpWX9AL3Ip173/u5Fq+VTPCng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RezGW7e2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RezGW7e2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y9PKk5qYRz2yMF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2024 22:36:09 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7fc8f0598cdso2948597a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2024 03:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734176166; x=1734780966; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NgMsVx6LalBM3WCUrF4IRtnX3JNL264uu8F1CqpXfck=;
        b=RezGW7e2iZItGgy1a+Xqa9Agjens8/g1SBYgqUcyPfz4BhPNXqlTOYo4dhIlj/ve6p
         76Zb9+PXK2Y+p6UB29lN35BmO9Fc7xEKqOsHOujgsEd2vhl8Wf0uyUIacCWcoD5sWsNW
         kAClMcne+h55DmwrQaAbO21Sx+ll0PK12uKYtzIEWWVHvTKnInRSQFPf8B8KIeMHc6aO
         GM4oanQiHGhCp5R+2i4VWqAHK4tn7cZ8N7ZRRG7l3bmqkPxJ9CuJkkoZNn+/QpLC1zGe
         DRQ5cDKHQ10GNNe2FzHzR9D1ahZgbgeIEgPjroFCaZgKlLwKI5QFGocu47soje2+5boK
         hSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734176166; x=1734780966;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NgMsVx6LalBM3WCUrF4IRtnX3JNL264uu8F1CqpXfck=;
        b=q3n40Ch7pxSCDqp2UxE9ilsposox+k308ekcPkKfAgI8UzGPGk6DVOTtx4PBNCe6Mc
         CuxnCqLCWWlahFIImN5Pa0x5uO/OHcayOY+8Eu/hG6CeTPfTJrzB+dBqBGpDux7l8NHh
         6GVVgr3oJxC4YW4yIJQVCZVJYyccuPWS2LQwESeuPbGACgcg2DfIfcpAlVU6fTi5/xRo
         MWEItteuZNFATiZa49go+/d5qD2RuNcYhEEIqK4tPpFjwfF+u+RCIoy1BU0srPaHQfGq
         6dOeTFer/FTnaY+Hb5ihwdyhxWgNvxvXBUidpIfpmrkOEm+2L89YJLK4/kMrlQfg3bam
         AQ/A==
X-Forwarded-Encrypted: i=1; AJvYcCWdohNIFtAwgXy2/6E1jcB4P/gML0gaTktaPFLZmHxI1pDr3gW35H8Un6I/F/3mmZ6UDUbiqBH4gdg3DKg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx5ZRtepVzEMXYiGEzaqFVY0ovyhzg50pK27mQb9Ffbp1PjVn4o
	QfQTXulbw5cHy+f0qops5Fk65Qu3vP4U2ZrX4qw1TXyr0r8IP7vA
X-Gm-Gg: ASbGncticbMT8ywMfZIXlSowfzkPseoe3VY6ncn46veKtCsGqgGn0ofITCNVy3m6r56
	uq4YYNPKPcskn8c6ybxpC73TjSOQL6fJc8x7074A5ic75R0Ny7O1Q/2W/5xrxKx28ufEqzCVCyJ
	klwINd26iAM4jvspjPuj329j25NZ7eE3NQhTmw/MLOnS2i+ticZcElUkG3nN/dKmA6o0gno3Oma
	nMJ8W5opiqne43zNpSDER9t1GxqYWLTsGEyUuICHElAkYmlFA==
X-Google-Smtp-Source: AGHT+IHuxCFVFrk8Vz9sT5di4OuvtpoJ5KJwPjtYYcpOUcj42oCLFujWWI/ejP+u2tQbAW68orgrnA==
X-Received: by 2002:a17:90b:3912:b0:2ee:463d:8e8d with SMTP id 98e67ed59e1d1-2f13ac560dfmr16513874a91.14.1734176166073;
        Sat, 14 Dec 2024 03:36:06 -0800 (PST)
Received: from dw-tp ([171.76.83.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2a1e9939fsm1266683a91.13.2024.12.14.03.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 03:36:05 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com> 
To: Narayana Murty N <nnmlinux@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, mahesh@linux.ibm.com, oohall@gmail.com, npiggin@gmail.com, christophe.leroy@csgroup.eu, maddy@linux.ibm.com, naveen@kernel.org, vaibhav@linux.ibm.com, ganeshgr@linux.ibm.com, sbhat@linux.ibm.com
Subject: Re: [PATCH v3] powerpc/pseries/eeh: Fix get PE state translation
In-Reply-To: <20241213091822.3641-1-nnmlinux@linux.ibm.com>
Date: Sat, 14 Dec 2024 16:58:12 +0530
Message-ID: <87v7vm8pwz.fsf@gmail.com>
References: <20241213091822.3641-1-nnmlinux@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

Narayana Murty N <nnmlinux@linux.ibm.com> writes:

> The PE Reset State "0" obtained from RTAS calls
> ibm_read_slot_reset_[state|state2] indicates that
> the Reset is deactivated and the PE is not in the MMIO
> Stopped or DMA Stopped state.
>
> With PE Reset State "0", the MMIO and DMA is allowed for
> the PE. The function pseries_eeh_get_state() is currently
> not indicating that to the caller because of  which the
> drivers are unable to resume the MMIO and DMA activity.
> The patch fixes that by reflecting what is actually allowed.
>
> Fixes: 00ba05a12b3c ("powerpc/pseries: Cleanup on pseries_eeh_get_state()")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
>
> ---
> Changelog:
> V1:https://lore.kernel.org/all/20241107042027.338065-1-nnmlinux@linux.ibm.com/

As discussed in v1, powernv already does this and this is needed for
pseries as well for the callers to know, whether the eeh recovery is
completed.

This looks good to me. Please feel free to add - 

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

-ritesh


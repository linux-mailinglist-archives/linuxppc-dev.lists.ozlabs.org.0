Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E98B897C07
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 01:26:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=v5aPLF+A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V918p700yz3vZN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 10:26:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=v5aPLF+A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=soleen.com (client-ip=2607:f8b0:4864:20::830; helo=mail-qt1-x830.google.com; envelope-from=pasha.tatashin@soleen.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V91801Dd2z30gK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 10:25:35 +1100 (AEDT)
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-432d5b5f00bso3171021cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Apr 2024 16:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712186732; x=1712791532; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GmJbmiupcx0+YepTHaKrpuRO+1mTwNA65vnk45fWOSs=;
        b=v5aPLF+ARRa67fxDk2LrV57NYZt/GcN4CxcRcaKS6rUSEkmV9mlBmDWCvK+OXBd5VK
         0Rz3jwlNVJoH98lg7AmCxBLTq5bNO2iFOASL57oIrT+RnJYVssn1jkBj/djCjd/EEFpY
         GRj5ZhsCV/tTFBaPaHs7GAd30GrqMpyAQOOeOOR9WRAdK8rJZ1fOYfPhlRgOe0ZXdAED
         sqH6WmwWIYDGRQLRqanlke2PfFdNPX5oM/TV6enI2rO4AZhQbFmvAoORcwRJpEJ8MiLw
         1XKb2mZRtCA/5e9EtPuPY0zWPwdIeSFFpwceS9wHqiy6vW+lMyOqjbKpEdRKhrQrSHV+
         99ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712186732; x=1712791532;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GmJbmiupcx0+YepTHaKrpuRO+1mTwNA65vnk45fWOSs=;
        b=NXdNUnSYQ1nJkE6m/FmZcJmMlObQzVbl2I1DH4LtvOjXM9JzwF5qlNlLyWxbT9j87v
         J7eFguP40Ae6RkblzqAT1OA4Kb36QbR0EYqZK+FAo0TsJwu8VDmDhEU6J6SmNjEDbjYB
         iwfq8WqNDsLyzJrdM5j1J+VG0H8plSwcOuejYfFv2MyrK5XMSY70eJGk6qlwyyzo4M0s
         SQ/2zjpeT/yY3Ekbx7F+FPy/4fVNMwu8wM9z5Uk9wSTa8XfECZoFRMVO6vAIWOOZbWzx
         423iHOmxY0s+95zJC0o8mu6G1XGroeZagonRpEQqhG1jURDno30R8iSwcuLUiqApZVq5
         Rnrg==
X-Gm-Message-State: AOJu0YzAu29LxLlmCInSmPpxTjwQacnhZiC/RdXt82fv/5+eiOd5ejmZ
	4Y8g7oq8eLReWOxKh+RWVC4Vwke35ZW/wBwRLyJUXHZu+QerN+GzG5O/6oLnLVQ58o0Wa1UAinO
	ker1t70RigYpN6EZsKgiKkW5vjltR50x+LPE4nA==
X-Google-Smtp-Source: AGHT+IG4cakVm4NzKcIyV/UubugIHhSwRR2qjKeTq6l1PskAOoNKG9I8iwXmwJY7qCLP7GuuPX2fJIJ3oNUu9sbQPRA=
X-Received: by 2002:a05:622a:306:b0:432:f37e:d274 with SMTP id
 q6-20020a05622a030600b00432f37ed274mr1865869qtw.8.1712186732715; Wed, 03 Apr
 2024 16:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240402051154.476244-1-rmclure@linux.ibm.com>
In-Reply-To: <20240402051154.476244-1-rmclure@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Apr 2024 19:24:55 -0400
Message-ID: <CA+CK2bA7qp91CKKqbLzrOsv3J88AwON71FTQ34JVKhi_c66s_Q@mail.gmail.com>
Subject: Re: [PATCH v12 00/11] Support page table check PowerPC
To: Rohan McLure <rmclure@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: x86@kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All patches in this series should be also CC'd to linux-kernel@vger.kernel.org.

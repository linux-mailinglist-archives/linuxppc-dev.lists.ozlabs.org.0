Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A81F3324E91
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 11:54:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmV6P4tT9z3cLk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 21:54:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=LoqcaDpa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LoqcaDpa; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmV611kHXz30Mk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 21:54:16 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id t5so4862886pjd.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 02:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=dTnK+j0tbSQXGzZ5QfyKv4xBnxA4AzD+ITB/2GfxtnY=;
 b=LoqcaDpa4kpBJeQHMvZbUrUwY1x0UGMp3O12T4EPdjOLCh054Worke68x1ZqhH95B/
 eiY9iNDoWH3E1672mphu1SqOkmf0d9zw6jdMblKmrC6G7GnCKX+MtBzEE5Q1o9Qsi+18
 F+8v7DpYTBEWoaONeZUMU0/ZqyZwLDK0bG9gQY8vH3zUWykqL3rmZ9aY8T5b8kebztc7
 VYFetZ46tcrMOF9MltcFXyKHm0QIJAWt6bkw4a9Tmsnry36g33rG/3LH0U0q+RLHi6Y5
 N7GB4ztDLKWHcuBXwNMzrmXtSBQ7kvdDe5wCE+ZDNHmjwlVSFjPMlzkoB9NK8VX7Nqmz
 cGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=dTnK+j0tbSQXGzZ5QfyKv4xBnxA4AzD+ITB/2GfxtnY=;
 b=uY84epp3b9dkOou4f+6zQKKHm6KZS+CJKygzW9eCRmUZn//ZlMcj898f0O2+Efvavw
 +NamZ/kLHA6C/1GA2gc+/f39qOXBLX0zzHpzYRb3WrqFg1Skr9t2VT8t8+yw2ULlGgT5
 1eMRQsA+CLLKtiJ6bV2PmD4Qr5W+AC8UxlYTe1I4DsrM9yslMABHBHR3MR6bNiaRiIxx
 oEvyxAzX2p8W6VgrroP+ofMXArIWspgfGapsf3nswk9BFB1idwlFeNIzN3lRtLnHXtPL
 XKWPAXd1/O5vv5UuYtSXMAHmBKkk83KHfwpn4A4+M8yef8RikLkytfj+M+roggjJLK2m
 X3aQ==
X-Gm-Message-State: AOAM530ppHcg6BFGSGSmLb63P64E2HfjCx35urN2yGxqcItyyMS5zLpm
 G18szYR7Iyv7LqZVwc2ZuPA=
X-Google-Smtp-Source: ABdhPJzCZi/l8mRU3ut9kaHsF/pbVSJIHHtTYMTWAEw4ZEejqpKM4KNJUjWODJKmj0iqw4iZP/Dmng==
X-Received: by 2002:a17:90a:4888:: with SMTP id
 b8mr2751665pjh.106.1614250455414; 
 Thu, 25 Feb 2021 02:54:15 -0800 (PST)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id v15sm5651428pgl.44.2021.02.25.02.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 02:54:14 -0800 (PST)
Date: Thu, 25 Feb 2021 20:54:08 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Is unrecoverable_exception() really an interrupt handler ?
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <2b89ac7e-e971-7de6-e6af-4bd86b699eab@csgroup.eu>
In-Reply-To: <2b89ac7e-e971-7de6-e6af-4bd86b699eab@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1614250349.l8kta8ppfx.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of February 24, 2021 6:15 pm:
> Hi Nick,
>=20
> You defined unrecoverable_exeption() as an interrupt handler in interrupt=
.h
>=20
> I think there are several issues around that:
>=20
> - do_bad_slb_fault() which is also an interrupt handler calls unrecoverab=
le_exeption()
> - in exception-64s.S, unrecoverable_exeption() is called after machine_ch=
eck_exception()
> - interrupt_exit_kernel_prepare() calls unrecoverable_exception()
>=20
> So in those cases, interrupt_enter_prepare() gets called twice, so things=
 like for instance=20
> account_cpu_user_entry() gets called twice.

Hi Christophe,

You are right of course.

I would say we can revert it back to a regular function. I would just=20
remove it completely from machine_check_exception too.

Thanks,
Nick

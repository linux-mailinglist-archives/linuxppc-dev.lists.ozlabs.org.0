Return-Path: <linuxppc-dev+bounces-13476-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 586E8C1778B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 01:08:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cx6ys6m7Jz304h;
	Wed, 29 Oct 2025 11:08:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1030"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761696501;
	cv=none; b=i+hbc7lqCSpZ244AQSIbGCPEBtfml9oKPoil9nhViGwnrjmrb5FmUxZUd1VRxEMbzcZ+0HvZvg/Hz1HkVoQOzSyLAeGyIwj1GpH+wb4W/Kff0gLwwiiCtTlomKnwg1yB5NAlUCHYylijWRyrHrbtvBo6LMvd+0xc2zRtdjpnnY4RRVmJ9TrtcxjiYUXUTFjYja18EtLl53N3XI3AfMlvChqYKXGwBXS+kV5p10PEwq4CzVZSth4LTmowXpqYeUMYwiW+t3I/ULgJdG8Gqv5DgXeouQx1p/REPtLQTqd3c/j3sSBjlnZaQRMqcJgdh/p8NAk1n/QFP2seEH2WaWRhWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761696501; c=relaxed/relaxed;
	bh=cZjzJP5BDJixdHcjsD4MEtXcdIeCfYM/75TifkWeDww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LGqE51292fuby+kZz8rYt/l+ESgpxEzweIjZ6pMQVZ+cuIw6UahozROT3SEJ3ast5chQcuAMSsAeu7xBz1thMCHA7BWqcAOW/vzN8OTjzweMbG3900A+qtKJD266s2NZ0oE3+eciClIXMVOqRFvIjnqHC8DdcPjGtBfmzmUGvhjPU4D0Xb1WdU/iNc42yLKIicCtr3zozOdqSARRBvaqjcyDYJ/8uJCnIubryNv+iDrgGSNY3WhToRgvR5Pf23rk5GtcOb+3gGL4RbkgrtL8E6AHKQ/2FIQzISMd32x03XrNhywY7qtHByzo+RaFxXGnwFu107kIm5YO+O6wgoHC4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=EKmdnexv; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org) smtp.mailfrom=paul-moore.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=EKmdnexv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=paul-moore.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cx6ys05Xwz2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 11:08:20 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-33e0008d3b3so6682223a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 17:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1761696499; x=1762301299; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZjzJP5BDJixdHcjsD4MEtXcdIeCfYM/75TifkWeDww=;
        b=EKmdnexvkDNngEgn3jVBLzWUR37qWjV/PXIcyVjesMcsgi+p1cDnq+U7XDVmAhunLX
         XTeH/XPVxNI4DGo4MLOm2vVRcTeSd64WtZE6gRCdlM+E4DhnSzqmnXwpGm1qfxEjj8Tn
         2NKV4zf5+tsmj94suuhhT5aJc78Xt9/A4L/V2Q8HsbjvkhSm9a4NcIxw4iDiyiIW7y6d
         wLgXh33o3kDsepEr25/Htcy6OQ/xEHBCmtlSSJrwSTCFZV8mBZPj9m2VODX7u+RBTDP2
         huQIb4MmJg4bvYUGztt4ucNdPHypw7kC6f7EGhMEZbjeqwNndPP5vPMuq8a74hZOkZsi
         bSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761696499; x=1762301299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZjzJP5BDJixdHcjsD4MEtXcdIeCfYM/75TifkWeDww=;
        b=Wogo8b0PHigV20510qHccMb88mUvDrabqhPPVOQ7u5/cDGmZJh9eUKm3uiF8AIbH67
         KkQd2XrDV3SPtFIukKkKlZkKc+/5taECVapWklmuZ20Pl8TOnihOBMcvVi+G5ETypg/X
         pzQFEFDe4AkWcva/7Hp1QrefKB/kADoNXatKbcL/7ESUr0ASiSATgOxWX5rfNpB8UlY+
         G8sOKMXyPYEhT6suECvHyzywAKTHXXsIyoKMsPzwR4BEqRsuRa1sZXaMdX+J6dlCxLKj
         pzndorlj7kb9C9Di+9j6h/vtbYtVr2+gegdZ2tsTNKTd10+i5fUxnN3Og3r3UUjKndWy
         p0uA==
X-Forwarded-Encrypted: i=1; AJvYcCUjecOsSaiCm9KFn7dBpwNBdYF8kQlO+O+JQL1r3ubzbJmD3LlghO5JMTPmtc1TSS4BzDY5oQdwVMgHA8o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzdvqw9Hchz7ccag31AoBJhJgk7u9tEXXI/Ew3hGDZIt6EzgpBw
	chJxPrzofFXaNdoX2lEi6bE0T3dN6OJ4XGdF3M4tf7IOnaEoH5xCo0FDCTfeExFUsOi0W8Lwz9s
	xdM69+vA843uNXLsvNQCikttJNsNbjBTbCX3SGTib
X-Gm-Gg: ASbGncveH/4MwQyfSSeIpSszSGIDsX4aOjd1CD88K2y5s/LJL2oXiKaMKcl23CV1MuU
	r/sBWET1TDFBlVeW/VQMMiHAy5zcI4ffwroA70BfGILMX2LxIKcyeSgoMRlTOjqLZher4FonHzt
	bf8IML/sxAfFjzSDOSutCn3ASyu+pmwJxbgLgxrdI557rK/KhQ10ctN5o8FMPfuWaIG4ZV8rXqr
	ZWj42CS5tdKmSI9Y6ht7sljQJMscW9kFlGDykLe3TOncsFjxbuhs+6+ZjuG
X-Google-Smtp-Source: AGHT+IGEKRPFq5L2rd6w/ubcuTn//BXhetf/wOj9xAOGHPjYYno+UXGan0WlvoJBaoZ1JF4tIK0SCxZjeiDlUqLjb6g=
X-Received: by 2002:a17:90b:4a05:b0:339:ef05:3575 with SMTP id
 98e67ed59e1d1-3403a294f2fmr971614a91.26.1761696498871; Tue, 28 Oct 2025
 17:08:18 -0700 (PDT)
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
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk> <20251028004614.393374-34-viro@zeniv.linux.org.uk>
In-Reply-To: <20251028004614.393374-34-viro@zeniv.linux.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 Oct 2025 20:08:07 -0400
X-Gm-Features: AWmQ_blBn2fdqYcxKi_H91_QLngZD09fAUzDyH5oMtRPekpRq9pqWMOuQKzGUHw
Message-ID: <CAHC9VhSeiK=qqLMUDAKRTgS5EEHdVvLD7-afuDqJWYFindvfUA@mail.gmail.com>
Subject: Re: [PATCH v2 33/50] selinuxfs: don't stash the dentry of /policy_capabilities
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
> Don't bother to store the dentry of /policy_capabilities - it belongs
> to invariant part of tree and we only use it to populate that directory,
> so there's no reason to keep it around afterwards.
>
> Same situation as with /avc, /ss, etc.  There are two directories that
> get replaced on policy load - /class and /booleans.  These we need to
> stash (and update the pointers on policy reload); /policy_capabilities
> is not in the same boat.
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
>  security/selinux/selinuxfs.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com


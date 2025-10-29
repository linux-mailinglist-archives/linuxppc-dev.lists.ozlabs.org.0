Return-Path: <linuxppc-dev+bounces-13510-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F723C19FCB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 12:24:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxPyt1MRvz3bfY;
	Wed, 29 Oct 2025 22:24:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761718737;
	cv=none; b=QQOCus+8vz6AIMonUpO+tz/Wjc3TStJepxZmVoQ7/0bmAD2B6kr4JTlit/2Z1n/HiE4gx1+8zdB/Lw10tCt75AlDcIsdMD96wcTZvbSM/CSGNaJUutosm9NU/fnCnWCtRP/H0jDx49CqCr0l/qLX69fF0k2dSk722CJQAeeGbGTxp3KReswMkgF3H1hJKkiI84+bgWl/BeY4wdD1txN9opFcAZ68bhhuG8xDWIQWvYeNyqQIvZc7PjN+yGYIuGrYFvnvPX+v5QhnM51kBXhpqrCfwihYJZUHoyzgTGsfaGN+vOzG/l/eHW1JH0GwpqOgwaB6iGFnN3ERUV7rm6h62Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761718737; c=relaxed/relaxed;
	bh=sNwUDE3GpjZgRRxK39FIaAoWLzOItBsyKBeQQ57qbFM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FfetL911FggrEyEHSHL56Rfw6euGdE3h530nuYwtJpK9DJmkutlnhYij3DBM3Y+zECa84lOAxbk/Ddu0J+UCxKF3f5rCjISikZzLji4JmBewLh4xfRi1NkgIHk7Z9DiOHsInxxSbm955WEB/+NtlUUlVIXWc6qAFfzFpPu3aEw4G8AKiBOT+hY5E7hAu1JtJVmsslA6uGix/42A+0zpwj4/T37rbmYZOQ5C4v/tHk7DSUr1oJP2fCvbzfTZmi2+oBLzubhdZhlLmWev6eoAq0ik9MBuTtAnHt4rTXYxDGArwiv8KYvf767FFMF8zWHIlZP0mKwxKA+k+3YDc5LoWag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Rk+6qLII; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=a.hindborg@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Rk+6qLII;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=a.hindborg@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxHBS6HtMz2yG3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 17:18:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D28244AB0;
	Wed, 29 Oct 2025 06:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92541C4CEF7;
	Wed, 29 Oct 2025 06:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761718733;
	bh=sNwUDE3GpjZgRRxK39FIaAoWLzOItBsyKBeQQ57qbFM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Rk+6qLII7dhXKc90DR7x0yOEvODjOW/vGOClfgVuFKE3QWXEzLxdfMqDCeOj2aCQC
	 Af7tFpcn1bA5YqBuP1vrNitK3sm7hW3KrYUEiQ3uUVlPgDiReiQJI+4PU5WchW6eKG
	 /h6vzvh0y93wx4HdCp/Guuc6ZBoGwAMJ5nQwd9g2jF4j4MbCDnBXz63JsAb0YVujnH
	 RPaDTnOSvsJkgMOZTcApLHzlog5soPtmuQGsnj9HF4Ql6o+0V30MAVN0BZ3P8otsW+
	 JyjsA3LXvuXmXdm+mAmvjC3CctniwC/hpFVHFmdzVIxYrqzOgGJawmQ9zcv0wDagWd
	 vR1pv53KN6RGw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Cc: torvalds@linux-foundation.org, brauner@kernel.org, jack@suse.cz,
 raven@themaw.net, miklos@szeredi.hu, neil@brown.name, linux-mm@kvack.org,
 linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, kees@kernel.org,
 rostedt@goodmis.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, paul@paul-moore.com, casey@schaufler-ca.com,
 linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com,
 selinux@vger.kernel.org, borntraeger@linux.ibm.com, bpf@vger.kernel.org
Subject: Re: [PATCH v2 10/50] configfs, securityfs: kill_litter_super() not
 needed
In-Reply-To: <20251028004614.393374-11-viro@zeniv.linux.org.uk>
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
 <iNj77i-tfrdVv9HEpIj_AzJNAUOKdPKNfNsGxMAfclR7sy-qVQBLpolv7Wgpmckad9w4QJXyH36_g88ejY-xpg==@protonmail.internalid>
 <20251028004614.393374-11-viro@zeniv.linux.org.uk>
Date: Wed, 29 Oct 2025 07:18:29 +0100
Message-ID: <87v7jyfcy2.fsf@t14s.mail-host-address-is-not-set>
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
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

"Al Viro" <viro@zeniv.linux.org.uk> writes:

> These are guaranteed to be empty by the time they are shut down;
> both are single-instance and there is an internal mount maintained
> for as long as there is any contents.
>
> Both have that internal mount pinned by every object in root.
>
> In other words, kill_litter_super() boils down to kill_anon_super()
> for those.
>
> Reviewed-by: Joel Becker <jlbec@evilplan.org>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

Acked-by: Andreas Hindborg <a.hindborg@kernel.org> (configfs)

Best regards,
Andreas Hindborg







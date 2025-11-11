Return-Path: <linuxppc-dev+bounces-14093-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D478C4D5E0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 12:18:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5PCp34flz2yyd;
	Tue, 11 Nov 2025 22:18:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::836"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762856913;
	cv=none; b=l/4flIogBeW+1hsBb1CKNYZBxZeRkc7eDMnIXXI4dUH2gj+yqHRDuXxq29ae01NAOYfg/NQ3c7rk/px9FbEeAheNR/d3mUeuBWldl+HuFg2MnlAoJZPKPUH1W6Q5yvwCFLHwrdwzHYABuUt9+KQdRW5dqEam2RYvj5Ienr/YahnQ2td9ErODcVKufl1mEmi5tFX9ISPVMl01WU/WDb/hqX4t176sVRY7EdNW3mGm6IC51o+ezQsiZyLdjXizHczHzX8tjI9CtEXH5HfCLf9rnoyQCgr4i3OcQga/FORd8Q17eKTErjLDJjpdaiX1usvhfrnq+tg1p1Z3OhiMx3LGgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762856913; c=relaxed/relaxed;
	bh=h/p7mEepN8jUuWyprYCkVkbNxCuAN/nU2Y/T4HHlQA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d1SEc+qr8CuH3sLvqDDoljN+TWZ3yWZov2O0b4Zf1qgDISYeWQmLaVB7LnBUfp4ZndFYmid9sDgj/U32f2w29wSmmvDmaG9HUasVpyQK38Bw8t+bctIbvI88JnC1K7KGZMAPtC/xt8tj178Dxbjm8PVa4McXMarbdvznbHvnlrD1cP20+GLIC+H2l6fKJY2lRFHGwTPkrI8+kC4GYqDSvCAhpUKWcPxKqYR3sk5ErRElEF4Ave0jF/TXz2xy/QVKLRavMCt7k4GowFQle/5njr0txpzytBgVcD9QqzRmKErBlveeJzTYV7+Xhw72HCS53BchPAyLwnUPJaxT971pkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; dkim=pass (1024-bit key; unprotected) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=V9FSvoA/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=miklos@szeredi.hu; receiver=lists.ozlabs.org) smtp.mailfrom=szeredi.hu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=V9FSvoA/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=szeredi.hu (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=miklos@szeredi.hu; receiver=lists.ozlabs.org)
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5N6S2GVfz308q
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 21:28:31 +1100 (AEDT)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4edb029249aso20330931cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 02:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1762856909; x=1763461709; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h/p7mEepN8jUuWyprYCkVkbNxCuAN/nU2Y/T4HHlQA0=;
        b=V9FSvoA/XwQIKVIQamWTyfHCHamgPFUsgqIH9AgNFWUOEBtCyj3MAzMVxN6BPLaz+m
         r/23qClhH3KzM7qeZMsdlv3/xZVG7rzFvtr5EhTpkA/EAR+cS1WMUWaRib/0lUyuQWRI
         QoP2OsHEzNg1cd8cM6x/FBMg/avE0AWSZ/BI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762856909; x=1763461709;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/p7mEepN8jUuWyprYCkVkbNxCuAN/nU2Y/T4HHlQA0=;
        b=j1/vIZlmR9Ur+04HabQck2Mb4Oqaa0EuazB7vXXegBrrhQz8qJaiL7C/yF1pJ5MBM3
         XasK9sk3kFjaV5l0bfhvFNF+wnL+omoHyxw83+C/X1BwiPwlHnB90af38D+QoaFAqx17
         euuadWs1LuQYQJNOlFrXPHXK1t589kE9oHdxI7T8hEmsW8ux18xJwuSGOU6U8OJbhUsQ
         2QyN1vIBh0lIu3kO3iWfrHABpKh84UHQR0cFAGZSB8V3ewkmUKf65eRf92n6iVdTzHxE
         HV2LBc840sNoLccXOHp1v+YANSQVkQDMKCwol2LivSRVgsTAhjiFL4MhIeGNfUkXESZm
         vCgg==
X-Forwarded-Encrypted: i=1; AJvYcCWe1keLOER/VsyTqm7Gc4nW+Vc3QD7iCOCq8nW9MP76520hyhVHvtQWCtPItrSNu7mGX9hGg9WtLujCJBs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwbFEuihVETabbukuHEnvGsiDSy8n5j2EkPPcAJZxi4IhVHglxm
	1Hm0Xb24gsoFR0AX1GIQinF1deDiJu3/V50KV4Omy8w5ojbeHiYjmzqs30GFHVVsDetOc32sh2Z
	pwPu0TPWmfiFNUTTMNIvqYYSR/5UY7vNFAvn/gFdzUg==
X-Gm-Gg: ASbGncvrZ7V3OhubiGYikaTnwh5eVeK9mvsLeLLuelPgU0/9dsw1LvpmvWPnHvkqgci
	N6P8GFnzwSqLgfAFeRLWM8643472jLlamCOve0B01WfyAKU6h6dhS1jTKa/tKV4FWw6GYhC7Vk1
	q42F1sPmU9aj20KijYSJGqcwQL6pIdiv4pjPexsZvSMN4zJ/L5p84D3ZkXgzQwR7saVZUwwyk+D
	ayXeY08dcaJXPQBWr2ZzVBiNT57lLRsuS98AOTyKn7f5Jdfe5UIRdUg46Y=
X-Google-Smtp-Source: AGHT+IF2jsXtOYznzAlKiswAAYjfBT86jbKpGaMbobTgICmObIV//j5aCRxdPYkP+19MfGrAnajQvcSXxRuiu1TbWoM=
X-Received: by 2002:a05:622a:1898:b0:4ed:602d:dfb8 with SMTP id
 d75a77b69052e-4eda5043040mr135933731cf.82.1762856908949; Tue, 11 Nov 2025
 02:28:28 -0800 (PST)
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
References: <20251111065520.2847791-1-viro@zeniv.linux.org.uk> <20251111065520.2847791-18-viro@zeniv.linux.org.uk>
In-Reply-To: <20251111065520.2847791-18-viro@zeniv.linux.org.uk>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 11 Nov 2025 11:28:17 +0100
X-Gm-Features: AWmQ_bl7He3VQsld2UXN2E831Naa9ot3hmwpZMaWScQnQVWsufspzsog6zo2yMQ
Message-ID: <CAJfpegv0jMq96xD8gSbMBydj=1wRixVGy+qd3feC2vSSn7v_rg@mail.gmail.com>
Subject: Re: [PATCH v3 17/50] convert fuse_ctl
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org, 
	brauner@kernel.org, jack@suse.cz, raven@themaw.net, neil@brown.name, 
	a.hindborg@kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, kees@kernel.org, rostedt@goodmis.org, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, paul@paul-moore.com, 
	casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 11 Nov 2025 at 07:55, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> objects are created in fuse_ctl_add_dentry() by d_alloc_name()+d_add(),
> removed by simple_remove_by_name().
>
> What we return is a borrowed reference - it is valid until the call of
> fuse_ctl_remove_conn() and we depend upon the exclusion (on fuse_mutex)
> for safety.  Return value is used only within the caller
> (fuse_ctl_add_conn()).
>
> Replace d_add() with d_make_persistent() + dput().  dput() is paired
> with d_alloc_name() and return value is the result of d_make_persistent().
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

Acked-by: Miklos Szeredi <mszeredi@redhat.com>


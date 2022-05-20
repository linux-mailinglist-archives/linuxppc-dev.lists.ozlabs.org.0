Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C0F52E449
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 07:20:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4FS32njyz3bnP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 15:20:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=a45I9bHl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=a45I9bHl; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4FRR560sz3bWm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 15:20:19 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so6980007pjh.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 22:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=K/PLBiF8Pr/q148VNplDk1LNNEks0HlLVS4FECpFtk0=;
 b=a45I9bHlZV03TA7eJ0Gqj3Yo+YCLPnzGR4M3xiFGag+OkiHUoIbvwcm3PAgpDSXyd7
 HZccCAHPSm2HIZurxjkVdift9KYhmqlKevSifKh0/uohYNDtcCpsyenlpNBzAPalqIsz
 PH54PqmMif6iYj1H1U48MFxrJJXFanHiAzL85jQ769Mp44bhlpphQqb7XrSMEr2Q8MgM
 4ze9lqLA2x7V0f1FkDPIu/gZaklrBHRME9LGRvtC54LHh9BlALkR+YVEAn5ky0hE6No7
 owHzghdSWtsgw/oyJ4rj6Eq5KxnfgjClgl2/gquH2AT0rf99whsYfapUZUblItJi/b21
 dS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=K/PLBiF8Pr/q148VNplDk1LNNEks0HlLVS4FECpFtk0=;
 b=36ikzCp+Fpqd61xPyZGFXYJWSNQ8azFOpWqSOQSqK9E8Qw0UTYgFkX1KTGQ5AmHth0
 p5lPmvVUWghY1QFP1G++9vD4h5BmWzGtji6urXsgXodHHqlkv0tYMVWRjO9JsRT3uZrF
 tDBWTnEuAwhZGDpxR6uhStFCK9jZ3SyVepYGvcnQ/PPh904lbjQcDmxtRezXa2qzCPPJ
 v1bvJxEdoA8bMFxXsrh8TGv4kfjX6a/pmI6+tVcTEz3lVHkBT206GZ7Np2V6wVKNWhTD
 Sik+d8tR0wZZOfZyWY5uYNdqs5qYyqJDgkcB9xYdVEGlGjPimZ8TMzLY1yaSMVm5ixBA
 P6Gw==
X-Gm-Message-State: AOAM533dcpRdV3yvWIC6PWME0S958A0nYvPP1EUfjsEi40b69OALsZb/
 5twBfqeNhgbnTeIfU4OzwfCWmQAzprqtUA==
X-Google-Smtp-Source: ABdhPJzLLdrQb7wEGqpXwdFGZfgit5YL1MLncUe7A4KvktQcB+Cd07elCLJYs79pl9bpMbEEnunm3w==
X-Received: by 2002:a17:90a:a614:b0:1df:8aec:cc71 with SMTP id
 c20-20020a17090aa61400b001df8aeccc71mr8842631pjq.82.1653024017882; 
 Thu, 19 May 2022 22:20:17 -0700 (PDT)
Received: from localhost ([203.87.15.124]) by smtp.gmail.com with ESMTPSA id
 y76-20020a62ce4f000000b004fa743ba3f9sm711520pfg.2.2022.05.19.22.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 22:20:17 -0700 (PDT)
Date: Fri, 20 May 2022 15:20:12 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the powerpc tree
To: Michael Ellerman <mpe@ellerman.id.au>, Stephen Rothwell
 <sfr@canb.auug.org.au>
References: <20220520083150.57e953fc@canb.auug.org.au>
In-Reply-To: <20220520083150.57e953fc@canb.auug.org.au>
MIME-Version: 1.0
Message-Id: <1653023904.pbe3pabbua.astroid@bobo.none>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Stephen Rothwell's message of May 20, 2022 8:31 am:
> Hi all,
>=20
> Commits
>=20
>   03a2e65f54b3 ("KVM: PPC: Book3S Nested: Use explicit 4096 LPID maximum"=
)
>   18827eeef022 ("KVM: PPC: Remove kvmppc_claim_lpid")
>=20
> are missing a Signed-off-by from their authors.

Sorry.

> The first is just "Signed-of-by" misspelling.  The second is missing.

My laptop's 'f' key has got much worse since then :(

Thanks,
Nick

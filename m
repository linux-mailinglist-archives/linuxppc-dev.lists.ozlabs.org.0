Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAAF60FB7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 12:00:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45gnJd6RtHzDqfP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 20:00:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="N80yXO1r"; 
 dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45gnBx3v5VzDqZQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2019 19:55:21 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id p184so5309465pfp.7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Jul 2019 02:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=7Go1TtPtDt1mLGzPtN8o+FPkxUVbo3zU2slFjoMVVcc=;
 b=N80yXO1rl3bXqIOMA3F4ebvdM10RRbPJxdjQ6Euc7EHujHXQfyhRakk1on1PMlzzqr
 gA1NkI9eqiN9suaa4pg98pOFqJcC4GhkQUShsh4wiK4bNrZndOjWlbULGxMBwnZQdcSN
 BkvWVFs+bUCz61YhuHfvoGvXu1Vagu3s1bj3Nj7xe5MuJ8mZTW6U9D8hj4/uinYPIjiH
 ZqKCuuNAnqKLE6wXcTpufUQb493Ddvb5uQLeqVhrF1jc3oVHC4aIrWiLNcvVMJXlLqkl
 ltRPJru0WT4LyuqQLERI87ZZQ5UjIuB/PX504RDQl8uiP0rsefyF5S6WbMKUt/j9yn80
 BhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=7Go1TtPtDt1mLGzPtN8o+FPkxUVbo3zU2slFjoMVVcc=;
 b=ZhXmbesMboS86UWbcFpzm+7q2SG0uKf63fq8ejHSY+b/J+RPd2IZFJtNQz6XuTKzN3
 azLek1UlqhCoiO9awOJ/ccOd9UOdk3EX2p0poZ2ryMWdaE6Gp/iPv1zoEmcNWwlEgFg6
 dQd7BRZltEBzWubaI0gBpZivJjXNPxODsiQQZT42+p4WC0FfZAEIsLUdi6835xnJ6fIX
 uQx0Sw/9iqMHYqGPgOxpRUheuXdhuLyla6gCJf6pcsMf+TxtZK5YLwiC+s18XhASINjU
 Nqluv7TAptZNiiaVLfeb8vI1ukO7ZDW+quFD/NwOHPlzvRAS3zW0CDMmRNyVyy8vDLko
 vNYw==
X-Gm-Message-State: APjAAAWvY1j7SaAeIrhO3tWfMYly9tCg1ybKyYTFtIFS21vH13RujLA1
 FO1t3cZ2YWLZ5MQ3ELemhWd3/fhY
X-Google-Smtp-Source: APXvYqxaBBTDv0lyJYcqUQFsCqviscRcgCnrPOh56z/kkZ4KwJmCzeqOgXTBdcEB4CKzbteiENPLUA==
X-Received: by 2002:a63:f807:: with SMTP id n7mr10536904pgh.119.1562406917337; 
 Sat, 06 Jul 2019 02:55:17 -0700 (PDT)
Received: from localhost (193-116-72-119.tpgi.com.au. [193.116.72.119])
 by smtp.gmail.com with ESMTPSA id q1sm19847473pfn.178.2019.07.06.02.55.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 06 Jul 2019 02:55:16 -0700 (PDT)
Date: Sat, 06 Jul 2019 19:53:45 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [v3 4/7] powerpc/mce: Handle UE event for memcpy_mcsafe
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Santosh Sivaraj
 <santosh@fossix.org>
References: <20190705212647.21750-1-santosh@fossix.org>
 <20190705212647.21750-5-santosh@fossix.org>
In-Reply-To: <20190705212647.21750-5-santosh@fossix.org>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1562406379.9eh1e6edgk.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Santosh Sivaraj's on July 6, 2019 7:26 am:
> If we take a UE on one of the instructions with a fixup entry, set nip
> to continue exucution at the fixup entry. Stop processing the event
> further or print it.

Minor nit, but can you instead a field in the mce data structure that
describes the property of the event, and then the code that intends to
ignore such events can test for it (with an appropriate comment).

So it would be has_fixup_handler or similar. Then queue_event can have
the logic

/*
 * Don't report this machine check because the caller has a fixup=20
 * handler which will do the appropriate error handling and reporting.
 */


> @@ -565,9 +567,18 @@ static int mce_handle_derror(struct pt_regs *regs,
>  	return 0;
>  }
> =20
> -static long mce_handle_ue_error(struct pt_regs *regs)
> +static long mce_handle_ue_error(struct pt_regs *regs,
> +				struct mce_error_info *mce_err)
>  {
>  	long handled =3D 0;
> +	const struct exception_table_entry *entry;
> +
> +	entry =3D search_exception_tables(regs->nip);

Uh oh, this searches module exception tables too... we can't do that
in real mode, can we?

Thanks,
Nick
=

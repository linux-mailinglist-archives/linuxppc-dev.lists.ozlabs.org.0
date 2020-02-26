Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8FB16F878
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 08:20:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S6dS6Z7zzDqZX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 18:20:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pt06raM3; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S6bV1hS0zDqCD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 18:18:30 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id d6so864266pgn.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 23:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=TS+48kjB6SCqLYkN8qgsVpDkJHauKSZA4JzhjUsO/84=;
 b=pt06raM387AtJIYfJNU2ZxmQE33ZHHDa+e1OCtQu8x6UWPFuxHnfNcv74sDr/1oX7W
 9CKDYM/Z3ptTYBFOnzzY9wtfzxCxsHuDA+JTkTmccSX02hoNYj6AS3Ddj20lli+yhkkE
 7RIwN8S95EnagBbFO+VAHt7w6vNwaAHOtjt1GcUCVO0UhQ2NPzKAzh7p9MsLAIn7bfQj
 N/stN/txxERgVGK3743rI8JEL2Biqm+KSaG8h6aEKcC+K24KXqRiXA+H7iyt9GwwKszi
 Ms6ubRv46vwHCeGybYxkYSMUpWjvZCV3DdYOJMgKvR8bBnpOjpKMl7mW7LXEWRSJ5xKm
 i5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=TS+48kjB6SCqLYkN8qgsVpDkJHauKSZA4JzhjUsO/84=;
 b=P08tadTEzWKoc1bi2CCv1ooVbYFw9QvUIVyQA1uVmxE5wSGryv3XCs2seU1FcpG6bl
 aB8QC5Wlvd3jh3C7I6RkJ4RC7PVr6gg6/nHA9swjnHrgtauwu8ZcTOHvX5ZvBktKb7Vu
 XTGWFToBSs6I1C9IYx5Oewi+tJcK6FeIWEpDayLe8rEDRgxmeoDb3Oi4bQg1cjgbon3o
 dujjiEDnwrFv5UNy7FfTztXZ4GVzrBLzdCHCwdvxJP2AyzbQLz8cnVjE5KY7zkx+orDk
 mZyuiLy/R8g5GjMdAoDgluZx+Ep6AUpYI14n8mkjCQSHeCOWyvLF+9BEIO9l+K0s9kda
 ZtfQ==
X-Gm-Message-State: APjAAAUBnNzXmauCCWnSbCQ5NYLubOSbrt8q7YvimiEkJcA+y1tqalNw
 5h4+Yvw/l/2N+Is9YCZ8t8rnAny3
X-Google-Smtp-Source: APXvYqxBze6h2JSXfrmOvzK20ahhJRPlfhSDhA/U8o56JVAiO0+aU4cZSv5mhbKhr+PbqlMUvSjKFA==
X-Received: by 2002:a63:7c4:: with SMTP id 187mr2405770pgh.369.1582701506972; 
 Tue, 25 Feb 2020 23:18:26 -0800 (PST)
Received: from localhost ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id b12sm1542900pfr.26.2020.02.25.23.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 23:18:26 -0800 (PST)
Date: Wed, 26 Feb 2020 17:14:15 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 11/14] powerpc/kprobes: Support kprobes on prefixed
 instructions
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200226040716.32395-1-jniethe5@gmail.com>
 <20200226040716.32395-12-jniethe5@gmail.com>
In-Reply-To: <20200226040716.32395-12-jniethe5@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1582700856.cbydlhx2wj.astroid@bobo.none>
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
Cc: alistair@popple.id.au, dja@axtens.net, bala24@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe's on February 26, 2020 2:07 pm:
> @@ -136,11 +148,14 @@ int arch_prepare_kprobe(struct kprobe *p)
>  	}
> =20
>  	if (!ret) {
> -		patch_instruction(p->ainsn.insn, *p->addr);
> +		patch_instruction(&p->ainsn.insn[0], p->addr[0]);
> +		if (IS_PREFIX(insn))
> +			patch_instruction(&p->ainsn.insn[1], p->addr[1]);
>  		p->opcode =3D *p->addr;

Not to single out this hunk or this patch even, but what do you reckon
about adding an instruction data type, and then use that in all these
call sites rather than adding the extra arg or doing the extra copy
manually in each place depending on prefix?

instrs_are_equal, get_user_instr, analyse_instr, patch_instruction,
etc., would all take this new instr. Places that open code a memory
access like your MCE change need some accessor

               instr =3D *(unsigned int *)(instr_addr);
-               if (!analyse_instr(&op, &tmp, instr, PPC_NO_SUFFIX)) {
+               if (IS_PREFIX(instr))
+                       suffix =3D *(unsigned int *)(instr_addr + 4);

Becomes
               read_instr(instr_addr, &instr);
	       if (!analyse_instr(&op, &tmp, instr)) ...

etc.

Thanks,
Nick
=

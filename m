Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C227E17C9D7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 01:41:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Z5JQ4gmDzF145
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 11:41:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=209.85.160.196; helo=mail-qt1-f196.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Z59p6jZpzDrQy
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 11:35:26 +1100 (AEDT)
Received: by mail-qt1-f196.google.com with SMTP id v22so3095000qtp.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2020 16:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=Llth3MhUyFBOi7p0WfyKRqezwCMBh50m9NEH4AtRH1U=;
 b=puvFN+Oa4Vsque2ZZFahxBROstqlUCh6OUM3IAJz/PpFxOEwXVBDL1w614Lf5OgLn5
 ZzOKj9HWOalPOfhv3WAYO45FNOPCCJIbnU41PCb5bB2Jpfed/n8m6G0z5zQoTE4+Y2y9
 3QJpAM3ou6c7EdgrRsfCmCg49mhT4wc3UBudKo0M3IjKzr4rlUXBE2NlETbQYMK6HNXK
 FaW2q4McGhTj2NCjdx0Iunur4hGozNvUDxm9RmqprWgyakpEZ4US8GkH1ltbTWFsHiOw
 CwD/p2KKStXpzjgcBMWXRzzvBYt1qmOtcsAsjRrYeh1r/v9yIBxJhh+Vq48gTXYafbjW
 E5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=Llth3MhUyFBOi7p0WfyKRqezwCMBh50m9NEH4AtRH1U=;
 b=QY3rprSTIIHUtJGp9GUbaxKaXRWyYL3ynV7a/mjAWa5ve1yZQFzxugQk4XQBcxwUhQ
 OYmjb5prwSfm68WVbNpt8G6TmYn2K+RY7G+sDNat8THzItr+K5pUYJU4pInmE8tdRatU
 aZgBkhs5ntJ5+2keDxR4MyIl9CTQGxbFEfo6nrMc2uWicuVzm5iRGkeVJgWHpKU1vaxR
 miyF6z/rDYLfOcJxYRtFCogF2YAeU4fEACUYFRVosvhoTSYWt04YopJ1LtnhRQsQZMuE
 Y+AqQflhQSuDTYcK4rL3gXQDrI7myFVhvDAs5qecWV6CxuHbTQu8yMdtsUzA6sM42jqG
 bVnQ==
X-Gm-Message-State: ANhLgQ2ALeALih6wAN5Q+O7FjLUHEGaxZFi07Si2eUlrrjyIsLMtH7Bt
 l4AAB9k97lgZUnIColM5J2u2vA==
X-Google-Smtp-Source: ADFU+vtIXuLKAhOxSRwmQknHK6gBQTO4ffulLvuvjqolLxIBY8IQ/C9gOq1OdEnF0L6YkCCsmh/eQw==
X-Received: by 2002:ac8:7b94:: with SMTP id p20mr5546904qtu.122.1583541260735; 
 Fri, 06 Mar 2020 16:34:20 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id 202sm18088610qkg.132.2020.03.06.16.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2020 16:34:19 -0800 (PST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V15] mm/debug: Add tests validating architecture page
 table helpers
Date: Fri, 6 Mar 2020 19:34:18 -0500
Message-Id: <CEEAD95E-D468-4C58-A65B-7E8AED91168A@lca.pw>
References: <61250cdc-f80b-2e50-5168-2ec67ec6f1e6@arm.com>
In-Reply-To: <61250cdc-f80b-2e50-5168-2ec67ec6f1e6@arm.com>
To: Anshuman Khandual <Anshuman.Khandual@arm.com>
X-Mailer: iPhone Mail (17D50)
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
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-snps-arc@lists.infradead.org,
 Vasily Gorbik <gor@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Mar 6, 2020, at 7:03 PM, Anshuman Khandual <Anshuman.Khandual@arm.com> w=
rote:
>=20
> Hmm, set_pte_at() function is not preferred here for these tests. The idea=

> is to avoid or atleast minimize TLB/cache flushes triggered from these sor=
t
> of 'static' tests. set_pte_at() is platform provided and could/might trigg=
er
> these flushes or some other platform specific synchronization stuff. Just

Why is that important for this debugging option?

> wondering is there specific reason with respect to the soft lock up proble=
m
> making it necessary to use set_pte_at() rather than a simple WRITE_ONCE() ?=


Looks at the s390 version of set_pte_at(), it has this comment,
vmaddr);

/*
 * Certain architectures need to do special things when PTEs
 * within a page table are directly modified.  Thus, the following
 * hook is made available.
 */

I can only guess that powerpc  could be the same here.=

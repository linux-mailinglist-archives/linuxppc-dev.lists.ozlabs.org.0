Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A877936B9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Sep 2023 10:02:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=Pb4lNhvG;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=8aX8Ngai;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RgZbC3ZFyz3cBJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Sep 2023 18:01:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=Pb4lNhvG;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=8aX8Ngai;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=suse.cz (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=vbabka@suse.cz; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RgZZL1Blkz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Sep 2023 18:01:14 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9201222407;
	Wed,  6 Sep 2023 08:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1693987258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Th6i3Ci6XMV5czHwHHRQpy4WXZpYK1vSc4mKPzvASOU=;
	b=Pb4lNhvGotAuMduqcxpX1veGfBW2fSsxbs9Pu7MCDvZuKYqbhIBY10E+hTUliKOLBUS8xT
	IScFwkZq92rxWtvku6iqGuFuVgR5lDAVbkoOihu7XH0KTBnfaYqyy4A7lldnkADZSSK6sy
	waSNnkdND+zVot6yoT1DyeMpgGyp2zc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1693987258;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Th6i3Ci6XMV5czHwHHRQpy4WXZpYK1vSc4mKPzvASOU=;
	b=8aX8Ngai6ZtyQlD2914oRoaCD9456/pp3O+p6YtiEHc05I1uh8Iu/T2mBUnSMDxI5k/fIo
	p/VLTw2WkzUAHvBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8ACD11346C;
	Wed,  6 Sep 2023 08:00:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2QG0ILkx+GRiVwAAMHmgww
	(envelope-from <vbabka@suse.cz>); Wed, 06 Sep 2023 08:00:57 +0000
Message-ID: <bcefb739-b45c-8349-8010-ac137ab61c29@suse.cz>
Date: Wed, 6 Sep 2023 10:00:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH gmem FIXUP] mm, compaction: make testing
 mapping_unmovable() safe
To: Sean Christopherson <seanjc@google.com>
References: <20230901082025.20548-2-vbabka@suse.cz>
 <ZPfAL0D95AwXD9tg@google.com>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <ZPfAL0D95AwXD9tg@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: kvm@vger.kernel.org, david@redhat.com, yu.c.zhang@linux.intel.com, linux-mips@vger.kernel.org, linux-mm@kvack.org, pbonzini@redhat.com, chao.p.peng@linux.intel.com, linux-riscv@lists.infradead.org, isaku.yamahata@gmail.com, paul@paul-moore.com, anup@brainfault.org, chenhuacai@kernel.org, jmorris@namei.org, willy@infradead.org, wei.w.wang@intel.com, tabba@google.com, jarkko@kernel.org, serge@hallyn.com, mail@maciej.szmigiero.name, aou@eecs.berkeley.edu, michael.roth@amd.com, ackerleytng@google.com, paul.walmsley@sifive.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, qperret@google.com, linux-kernel@vger.kernel.org, oliver.upton@linux.dev, linux-security-module@vger.kernel.org, palmer@dabbelt.com, kvm-riscv@lists.infradead.org, maz@kernel.org, linux-fsdevel@vger.kernel.org, liam.merwick@oracle.com, akpm@linux-foundation.org, vannapurve@google.com, linuxppc-dev@lists.ozlabs.org, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/6/23 01:56, Sean Christopherson wrote:
> On Fri, Sep 01, 2023, Vlastimil Babka wrote:
>> As Kirill pointed out, mapping can be removed under us due to
>> truncation. Test it under folio lock as already done for the async
>> compaction / dirty folio case. To prevent locking every folio with
>> mapping to do the test, do it only for unevictable folios, as we can
>> expect the unmovable mapping folios are also unevictable - it is the
>> case for guest memfd folios.
> 
> Rather than expect/assume that unmovable mappings are always unevictable, how about
> requiring that?  E.g. either through a VM_WARN_ON in mapping_set_unmovable(), or by
> simply having that helper forcefully set AS_UNEVICTABLE as well.

Yeah I guess we could make the helper do that, with a comment, as gmem is
the only user right now. And if in the future somebody has case where it
makes sense to have unmovable without unevictable, we can discuss what to do
about it then.

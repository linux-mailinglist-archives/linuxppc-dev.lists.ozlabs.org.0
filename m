Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 357AD7F9E4A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 12:14:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sf2zZ5Nq4z3cVY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 22:14:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=vbabka@suse.cz; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sf2z60Hg0z3bZM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Nov 2023 22:14:10 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E414521C6F;
	Mon, 27 Nov 2023 11:13:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C5491367B;
	Mon, 27 Nov 2023 11:13:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Pc/rIfd5ZGXRZQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 27 Nov 2023 11:13:59 +0000
Message-ID: <81628606-ca9b-866f-5e71-91001e856871@suse.cz>
Date: Mon, 27 Nov 2023 12:13:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v13 17/35] KVM: Add transparent hugepage support for
 dedicated guest memory
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>
References: <20231027182217.3615211-18-seanjc@google.com>
 <7c0844d8-6f97-4904-a140-abeabeb552c1@intel.com>
 <ZUEML6oJXDCFJ9fg@google.com>
 <92ba7ddd-2bc8-4a8d-bd67-d6614b21914f@intel.com>
 <ZUJVfCkIYYFp5VwG@google.com>
 <CABgObfaw4Byuzj5J3k48jdwT0HCKXLJNiuaA9H8Dtg+GOq==Sw@mail.gmail.com>
 <ZUJ-cJfofk2d_I0B@google.com>
 <4ca2253d-276f-43c5-8e9f-0ded5d5b2779@redhat.com>
 <ZULSkilO-tdgDGyT@google.com>
 <CABgObfbq_Hg0B=jvsSDqYH3CSpX+RsxfwB-Tc-eYF4uq2Qw9cg@mail.gmail.com>
 <ZUPCWfO1iO77-KDA@google.com>
 <CABgObfa=DH7FySBviF63OS9sVog_wt-AqYgtUAGKqnY5Bizivw@mail.gmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <CABgObfa=DH7FySBviF63OS9sVog_wt-AqYgtUAGKqnY5Bizivw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: ***************
X-Spamd-Bar: +++++++++++++++
Authentication-Results: smtp-out1.suse.de;
	dkim=none;
	dmarc=none;
	spf=softfail (smtp-out1.suse.de: 2a07:de40:b281:104:10:150:64:97 is neither permitted nor denied by domain of vbabka@suse.cz) smtp.mailfrom=vbabka@suse.cz
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [15.89 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 R_SPF_SOFTFAIL(4.60)[~all];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_MATCH_FROM(0.00)[];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DMARC_NA(1.20)[suse.cz];
	 NEURAL_SPAM_SHORT(3.00)[1.000];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 RCPT_COUNT_TWELVE(0.00)[44];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[intel.com,kernel.org,linux.dev,ellerman.id.au,brainfault.org,sifive.com,dabbelt.com,eecs.berkeley.edu,zeniv.linux.org.uk,infradead.org,linux-foundation.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,kvack.org,linux.intel.com,google.com,digikod.net,maciej.szmigiero.name,redhat.com,amd.com,oracle.com,gmail.com];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Score: 15.89
X-Rspamd-Queue-Id: E414521C6F
X-Spam-Flag: YES
X-Spam: Yes
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?= =?UTF-8?Q?n?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Anup Patel <anup@brainfau
 lt.org>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/2/23 16:46, Paolo Bonzini wrote:
> On Thu, Nov 2, 2023 at 4:38 PM Sean Christopherson <seanjc@google.com> wrote:
>> Actually, looking that this again, there's not actually a hard dependency on THP.
>> A THP-enabled kernel _probably_  gives a higher probability of using hugepages,
>> but mostly because THP selects COMPACTION, and I suppose because using THP for
>> other allocations reduces overall fragmentation.
> 
> Yes, that's why I didn't even bother enabling it unless THP is
> enabled, but it makes even more sense to just try.
> 
>> So rather than honor KVM_GUEST_MEMFD_ALLOW_HUGEPAGE iff THP is enabled, I think
>> we should do the below (I verified KVM can create hugepages with THP=n).  We'll
>> need another capability, but (a) we probably should have that anyways and (b) it
>> provides a cleaner path to adding PUD-sized hugepage support in the future.
> 
> I wonder if we need KVM_CAP_GUEST_MEMFD_HUGEPAGE_PMD_SIZE though. This
> should be a generic kernel API and in fact the sizes are available in
> a not-so-friendly format in /sys/kernel/mm/hugepages.
> 
> We should just add /sys/kernel/mm/hugepages/sizes that contains
> "2097152 1073741824" on x86 (only the former if 1G pages are not
> supported).
> 
> Plus: is this the best API if we need something else for 1G pages?
> 
> Let's drop *this* patch and proceed incrementally. (Again, this is
> what I want to do with this final review: identify places that are
> stil sticky, and don't let them block the rest).
> 
> Coincidentially we have an open spot next week at plumbers. Let's
> extend Fuad's section to cover more guestmem work.

Hi,

was there any outcome wrt this one? Based on my experience with THP's it
would be best if userspace didn't have to opt-in, nor care about the
supported size. If the given size is unaligned, provide a mix of large pages
up to an aligned size, and for the rest fallback to base pages, which should
be better than -EINVAL on creation (is it possible with the current
implementation? I'd hope so so?). A way to opt-out from huge pages could be
useful although there's always the risk of some initial troubles resulting
in various online sources cargo-cult recommending to opt-out forever.

Vlastimil

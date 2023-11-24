Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 170747F6F16
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 10:02:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sc8C40FKkz30Ng
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 20:02:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=vbabka@suse.cz; receiver=lists.ozlabs.org)
X-Greylist: delayed 424 seconds by postgrey-1.37 at boromir; Fri, 24 Nov 2023 20:02:27 AEDT
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sc8BW6zMXz3cTj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 20:02:27 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 65D691FB72;
	Fri, 24 Nov 2023 08:55:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 586141340B;
	Fri, 24 Nov 2023 08:55:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id w08iFfRkYGW9WgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Fri, 24 Nov 2023 08:55:16 +0000
Message-ID: <d9631191-2805-d531-41a8-7152d9f72fa6@suse.cz>
Date: Fri, 24 Nov 2023 09:55:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [powerpc] Lockups seen during/just after boot (bisected)
Content-Language: en-US
To: Chengming Zhou <zhouchengming@bytedance.com>,
 Sachin Sant <sachinp@linux.ibm.com>, linux-mm@kvack.org
References: <5F8DAEC7-E815-40A5-AD4A-B01296F5165F@linux.ibm.com>
 <8e000449-1e11-43be-87f5-f1826e296c39@bytedance.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <8e000449-1e11-43be-87f5-f1826e296c39@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Bar: ++++++++++++
X-Spam-Score: 12.91
X-Rspamd-Server: rspamd1
X-Spam-Level: ************
X-Rspamd-Queue-Id: 65D691FB72
X-Spam-Flag: NO
Authentication-Results: smtp-out2.suse.de;
	dkim=none;
	dmarc=none;
	spf=softfail (smtp-out2.suse.de: 2a07:de40:b281:104:10:150:64:97 is neither permitted nor denied by domain of vbabka@suse.cz) smtp.mailfrom=vbabka@suse.cz
X-Spamd-Result: default: False [12.91 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 ARC_NA(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DMARC_NA(1.20)[suse.cz];
	 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 R_SPF_SOFTFAIL(4.60)[~all];
	 RCVD_COUNT_THREE(0.00)[3];
	 NEURAL_SPAM_SHORT(2.88)[0.960];
	 MX_GOOD(-0.01)[];
	 BAYES_HAM(-0.01)[45.28%];
	 NEURAL_SPAM_LONG(2.64)[0.755];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:106:10:150:64:167:received];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/23/23 15:35, Chengming Zhou wrote:
> On 2023/11/23 19:27, Sachin Sant wrote:
>> While booting recent -next kernel on IBM Power server, I have observed lockups
>> either during boot or just after.
>> 
>> [ 3631.015775] watchdog: CPU 3 self-detected hard LOCKUP @ __update_freelist_slow+0x74/0x90
> 
> Sorry, the bug can be fixed by this patch from Vlastimil Babka:
> 
> https://lore.kernel.org/all/83ff4b9e-94f1-8b35-1233-3dd414ea4dfe@suse.cz/

The current -next should be fixed, the fix was folded to the preparatory
commit, which is now:

8a399e2f6003 ("slub: Keep track of whether slub is on the per-node partial
list")

> Thanks!


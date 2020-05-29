Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D621E7DB2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 14:56:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YPhZ6Zh8zDqF7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 22:56:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=xmission.com (client-ip=166.70.13.233;
 helo=out03.mta.xmission.com; envelope-from=ebiederm@xmission.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=xmission.com
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YPZ11DKxzDqfK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 22:50:47 +1000 (AEST)
Received: from in02.mta.xmission.com ([166.70.13.52])
 by out03.mta.xmission.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.90_1)
 (envelope-from <ebiederm@xmission.com>)
 id 1jeeTE-0005qt-8n; Fri, 29 May 2020 06:50:44 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
 helo=x220.xmission.com) by in02.mta.xmission.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
 (envelope-from <ebiederm@xmission.com>)
 id 1jeeTD-0003ED-FV; Fri, 29 May 2020 06:50:44 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Luis Chamberlain <mcgrof@kernel.org>
References: <20200529074108.16928-1-mcgrof@kernel.org>
 <20200529074108.16928-3-mcgrof@kernel.org>
Date: Fri, 29 May 2020 07:46:49 -0500
In-Reply-To: <20200529074108.16928-3-mcgrof@kernel.org> (Luis Chamberlain's
 message of "Fri, 29 May 2020 07:40:57 +0000")
Message-ID: <871rn2ucw6.fsf@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1jeeTD-0003ED-FV; ; ; mid=<871rn2ucw6.fsf@x220.int.ebiederm.org>;
 ; ; hst=in02.mta.xmission.com; ; ; ip=68.227.160.95; ; ;
 frm=ebiederm@xmission.com; ; ; spf=neutral
X-XM-AID: U2FsdGVkX19xJd9zhYzjVHcE/QklKE0A5DUgoINg4EA=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa06.xmission.com
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,T_TooManySym_01,
 T_TooManySym_02,T_TooManySym_03,XMNoVowels,XMSubLong
 autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.4769]
 *  1.5 XMNoVowels Alpha-numberic number with no vowels
 *  0.7 XMSubLong Long Subject
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa06 0; Body=1 Fuz1=1 Fuz2=1]
 *  0.0 T_TooManySym_02 5+ unique symbols in subject
 *  0.0 T_TooManySym_03 6+ unique symbols in subject
 *  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: ; sa06 0; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: **;Luis Chamberlain <mcgrof@kernel.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 353 ms - load_scoreonly_sql: 0.06 (0.0%),
 signal_user_changed: 11 (3.1%), b_tie_ro: 10 (2.7%), parse: 0.92
 (0.3%), extract_message_metadata: 2.6 (0.7%), get_uri_detail_list:
 0.49 (0.1%), tests_pri_-1000: 4.5 (1.3%), tests_pri_-950: 1.33 (0.4%),
 tests_pri_-900: 1.21 (0.3%), tests_pri_-90: 172 (48.7%), check_bayes:
 170 (48.2%), b_tokenize: 6 (1.8%), b_tok_get_all: 7 (1.9%),
 b_comp_prob: 1.99 (0.6%), b_tok_touch_all: 151 (42.8%), b_finish: 0.97
 (0.3%), tests_pri_0: 140 (39.5%), check_dkim_signature: 0.48 (0.1%),
 check_dkim_adsp: 2.5 (0.7%), poll_dns_idle: 0.77 (0.2%), tests_pri_10:
 3.1 (0.9%), tests_pri_500: 9 (2.6%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH 02/13] cdrom: use new sysctl subdir helper
 register_sysctl_subdir()
X-Spam-Flag: No
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
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
Cc: jack@suse.cz, rafael@kernel.org, airlied@linux.ie, amir73il@gmail.com,
 clemens@ladisch.de, dri-devel@lists.freedesktop.org,
 joseph.qi@linux.alibaba.com, sfr@canb.auug.org.au, mark@fasheh.com,
 rdna@fb.com, yzaikin@google.com, joonas.lahtinen@linux.intel.com,
 keescook@chromium.org, arnd@arndb.de, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, julia.lawall@lip6.fr, viro@zeniv.linux.org.uk,
 rodrigo.vivi@intel.com, nixiaoming@huawei.com, vbabka@suse.cz, axboe@kernel.dk,
 tytso@mit.edu, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 daniel@ffwll.ch, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com, jlbec@evilplan.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Luis Chamberlain <mcgrof@kernel.org> writes:

> This simplifies the code considerably. The following coccinelle

With register_sysctl the code would read:

	cdrom_sysctl_header = register_sysctl("dev/cdrom", cdrom_table);

Please go that direction.  Thank you.

Eric

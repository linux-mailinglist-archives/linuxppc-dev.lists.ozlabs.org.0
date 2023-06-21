Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 835B0738F2E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 20:51:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmXf539MNz3btl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 04:51:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=talpey.com (client-ip=2a01:111:f400:7ea9::614; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=tom@talpey.com; receiver=lists.ozlabs.org)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on20614.outbound.protection.outlook.com [IPv6:2a01:111:f400:7ea9::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmWzP4Tgwz30gq;
	Thu, 22 Jun 2023 04:21:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nr7v07ezgcIYGko/0cLNlrscvaKeDbhl+itBiziiSh6RHZ9benFU0G82NA8aAZAH4C2oVq+CZWTlj/xDnx0sHCHjjhzx0wx48H0f7SaY3SXtA0dHAQxS66J7oAdRJcUaiiaArywkNBexp7wdRDA7ls/fR+F8Mh+a3b19XMbEd1KgTugHIBDe3rnOpEtMKQGl0Fh/pE5Vgd+Ul+fF+EDiyyqPhu5kK4tsx8W8LRJoz3cjZQJ+LM3m//tfjKnLVxPzZHOHSVg/xvxa0QAREh0MXdI/HzN/bRvoly2Bx/xiaebSfLJkkjW+EJKjNfHQTCBKjfKBjwWUtUVP1kb51sq1mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7WQgwUnIlvowLca6tfesDHaE6AffzelklxR0YPv2bs=;
 b=CC+4B6eWAKc+87dDalIbhJl374jn5MKG+QQ8osPuzxXuH5Hve0EkwTZBOr5chv9R9fEQ17B9ompjY8Gce+IPafzigUSkkJoU2e8Px6CNl00Se3qx8eiWdnrrxj3l2EJbnVHDQ42IS7ym06I/KYWI2u0BSu2S8XXs5VSaG7WJ9WtVF9UcRzKggiP42juhIWnl0m1bedtNC4+3q+lL0MLEmCM6g3dToiq36oDGJ+ISSQqk/PZHFb9DUuFSnXnBFhUOBhyURnKeH5PpEGo70ibrg4K2AiXsPNSQiGyHyIkVVH88e75WUhpeIgG5dCvE22qL0cg4TBck9vAPYbBofG42zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from SN6PR01MB4445.prod.exchangelabs.com (2603:10b6:805:e2::33) by
 IA0PR01MB8350.prod.exchangelabs.com (2603:10b6:208:492::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.23; Wed, 21 Jun 2023 18:20:56 +0000
Received: from SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::17e9:7e30:6603:23bc]) by SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::17e9:7e30:6603:23bc%5]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 18:20:56 +0000
Message-ID: <e513d856-3a6f-3a32-40fe-6c728e7b5ec8@talpey.com>
Date: Wed, 21 Jun 2023 14:19:56 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 01/79] fs: add ctime accessors infrastructure
Content-Language: en-US
To: Jeff Layton <jlayton@kernel.org>, Jeremy Kerr <jk@ozlabs.org>,
 Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=c3=b8nnev=c3=a5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Brad Warrum <bwarrum@linux.ibm.com>, Ritu Agarwal <rituagar@linux.ibm.com>,
 Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov
 <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 David Sterba <dsterba@suse.com>, David Howells <dhowells@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Ian Kent <raven@themaw.net>,
 Luis de Bethencourt <luisbg@kernel.org>, Salah Triki
 <salah.triki@gmail.com>, "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu,
 Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
 Nicolas Pitre <nico@fluxnic.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Tyler Hicks <code@tyhicks.com>, Ard Biesheuvel <ardb@kernel.org>,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 Yue Hu <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>,
 Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Miklos Szeredi <miklos@szeredi.hu>, Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Mike Kravetz <mike.kravetz@oracle.com>, Muchun Song <muchun.song@linux.dev>,
 David Woodhouse <dwmw2@infradead.org>, Dave Kleikamp <shaggy@kernel.org>,
 Tejun Heo <tj@kernel.org>, Trond Myklebust
 <trond.myklebust@hammerspace.com>, Anna Schumaker <anna@kernel.org>,
 Chuck Lever <chuck.lever@oracle.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Anton Altaparmakov <anton@tuxera.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Mark Fasheh <mark@fasheh.com>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Bob Copeland <me@bobcopeland.com>, Mike Marshall <hubcap@omnibond.com>,
 Martin Brandenburg <martin@omnibond.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Iurii Zaikin <yzaikin@google.com>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Anders Larsen <al@alarsen.net>,
 Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Shyam Prasad N
 <sprasad@microsoft.com>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Evgeniy Dushistov <dushistov@mail.ru>,
 Hans de Goede <hdegoede@redhat.com>, "Darrick J. Wong" <djwong@kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>,
 Johannes Thumshirn <jth@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 John Johansen <john.johansen@canonical.com>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Eric Paris <eparis@parisplace.org>, Juergen Gross <jgross@suse.com>,
 Ruihan Li <lrh2000@pku.edu.cn>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Udipto Goswami <quic_ugoswami@quicinc.com>,
 Linyu Yuan <quic_linyyuan@quicinc.com>, John Keeping <john@keeping.me.uk>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Dan Carpenter <error27@gmail.com>, Yuta Hayama <hayama@lineo.co.jp>,
 Jozef Martiniak <jomajm@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Alan Stern <stern@rowland.harvard.edu>, Sandeep Dhavale
 <dhavale@google.com>, Dave Chinner <dchinner@redhat.com>,
 Johannes Weiner <hannes@cmpxchg.org>, ZhangPeng <zhangpeng362@huawei.com>,
 Viacheslav Dubeyko <slava@dubeyko.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Aditya Garg <gargaditya08@live.com>, Erez Zadok <ezk@cs.stonybrook.edu>,
 Yifei Liu <yifeliu@cs.stonybrook.edu>, Yu Zhe <yuzhe@nfschina.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Oleg Kanatov <okanatov@gmail.com>, "Dr. David Alan Gilbert"
 <linux@treblig.org>, Jiangshan Yi <yijiangshan@kylinos.cn>,
 xu xin <cgel.zte@gmail.com>, Stefan Roesch <shr@devkernel.io>,
 Zhihao Cheng <chengzhihao1@huawei.com>,
 "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, Minghao Chi <chi.minghao@zte.com.cn>,
 Seth Forshee <sforshee@digitalocean.com>,
 Zeng Jingxiang <linuszeng@tencent.com>, Bart Van Assche
 <bvanassche@acm.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Roberto Sassu <roberto.sassu@huawei.com>, Zhang Yi <yi.zhang@huawei.com>,
 Tom Rix <trix@redhat.com>, "Fabio M. De Francesco"
 <fmdefrancesco@gmail.com>, Chen Zhongjin <chenzhongjin@huawei.com>,
 Zhengchao Shao <shaozhengchao@huawei.com>, Rik van Riel <riel@surriel.com>,
 Jingyu Wang <jingyuwang_vip@163.com>, Hangyu Hua <hbh25y@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-usb@vger.kernel.org, v9fs@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org,
 autofs@vger.kernel.org, linux-mm@kvack.org, linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu,
 ecryptfs@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-um@lists.infradead.org, linux-mtd@lists.infradead.org,
 jfs-discussion@lists.sourceforge.net, linux-nfs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com,
 linux-karma-devel@lists.sourceforge.net, devel@lists.orangefs.org,
 linux-unionfs@vger.kernel.org, linux-hardening@vger.kernel.org,
 reiserfs-devel@vger.kernel.org, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-trace-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org
References: <20230621144507.55591-1-jlayton@kernel.org>
 <20230621144507.55591-2-jlayton@kernel.org>
 <1f97d595-e035-46ce-6269-eebfe922cf35@talpey.com>
 <6f4bcd7d79f688120d80e96e86d7c521854d8e84.camel@kernel.org>
From: Tom Talpey <tom@talpey.com>
In-Reply-To: <6f4bcd7d79f688120d80e96e86d7c521854d8e84.camel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0210.eurprd05.prod.outlook.com
 (2603:10a6:20b:495::23) To SN6PR01MB4445.prod.exchangelabs.com
 (2603:10b6:805:e2::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4445:EE_|IA0PR01MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fbfc737-aa36-44b7-2892-08db72844160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ZLCznT9A2gI2Bnod11qzVuYKTRdUFyai9zFIi6Ury1zvBLek7sPyP9rq/nXB1g1G4ro9TQa19BhHS4udc3KnL/fvmqxGm3JH9MCAWOyl4xJ5sNNR9xP1O/w3l2JItEqPtdVvNSgsPLS1N6pgBrlMnFCfueynAMt3+U4udBh8PVMOJDOrxhzOBISJ+cpLBUebXBCgq4M/3i5oW0noPDlomxWKGHC7IKOaR0kWDb1rOFXZ72kTjitHhMqfNqbaW5bnMlnwlgiG5JqqhScYFhSdRaw7xlXDEWmqtYYf77NMFvP2d0ePrswPj2o+PIUzYYKSLPsKCMIfCnGjdF4JX98swKNmNA+2OO45IUCr8oBbMPEgJjL8XLfN93hbgh7W0fsG7qX05KT++EQjqKXC8Yvb2WZB8Bjw5GZ4x1Xy7JFB5DRqZvqe6jRx+qQZTFuZ9N8P4kJG3c92/R4lktI59IV2pjQKR/lb9EL5RQZLGjfjKM8hlIBy3dNUCgQ6/AaSTTuDjEd0NHKm4Fjxt2RdJA7VZvG4ntUV9BdC9hQ5rfmzdwxnvKBiS6c8F5FlPXtWn64ZtISe9kYiM23nriqZSiU8Gw1qyvJ5aS7ORKlNsdTBh9R753iWmLYP1XuE1+EdoG9cRG5u5vabHDp5frJfCBxr/bLEH0q6cDnhOEv9m88FZfI=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR01MB4445.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39840400004)(396003)(376002)(136003)(346002)(451199021)(38100700002)(38350700002)(921005)(5660300002)(53546011)(26005)(6512007)(6506007)(83380400001)(186003)(2616005)(7336002)(7366002)(7416002)(7276002)(41300700001)(2906002)(8676002)(8936002)(7406005)(36756003)(478600001)(6486002)(52116002)(66476007)(1191002)(66556008)(66946007)(316002)(31696002)(86362001)(76576003)(110136005)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?VWg4bkp1REcrK3U1d3lnOG9TTlN2bXFaV2ltNkU1bmFSeUJpMWF3NThCWGE0?=
 =?utf-8?B?QVEvYTZhRnFkdjFZS3VjbFJ4OUhHVk1GOEMvZGs1c01SbE56ZHQyR2JUMi9y?=
 =?utf-8?B?WjVUWXh2SzNrVU9mQ1V1SXBmS2ZRaGNRRk50UkoxR0RERFhHRU9vcnRNM1RD?=
 =?utf-8?B?QXhUMnVsbVVSSmlPZXRYRlNGTFVxNUhaUzhUOE1paXFuU3lmeU1ldHRCa2ZW?=
 =?utf-8?B?R1pXbnFEc0lVVWVTZ0hvM2pML3AwR2t5TVhNRUJFTlVIdzlVbU9Lc2R2K0o3?=
 =?utf-8?B?QVVYcERuMDk3T0w0K0grYzBZN283dkE1THg5dXNvclJKLzB0YUE3OEU4d1BH?=
 =?utf-8?B?end3S2FYRmVJZXRFSWN6MGIweFk4WUhPYVB4TEE1MVhEM2NndlpWVElob2Rm?=
 =?utf-8?B?ZG5NSVdpOFFKOTV5VlFPNzZHV3NtcUFSME5KeWViMHFGdlFYQnpXU1QwRmJt?=
 =?utf-8?B?V2FOTnc2QWpHS0hCRWN5VmQ2dVd0TVhBd1k0WkhFL2w3L25Ta3gzRTdwamR5?=
 =?utf-8?B?ZE4xWlNncXBaZmxKM1JqTjNhYjdxVTdwTEYyUEtKL1JRbjZRZ1dUUDY1MThn?=
 =?utf-8?B?dmFzdVUzRmtuaFJVc05jMkdYbDg0blZtbGt0ZHB4MWkrV1Z5eUhSWE9qckRH?=
 =?utf-8?B?amFlYjIycWJsbHpMTHI4NkhTU010Q3hBeUVzQmpUWERWTHRveE1VUXBHWWNV?=
 =?utf-8?B?dU9kalpOclBHT2xpNXNUY1cxdDBLdnIzdmpqOVJ0U0tKcFo4QWlna3hQcHVk?=
 =?utf-8?B?R1cyYy93b1BZTlQ3c1VpR2RVbnl1Wjh0dVhCcTFvL0Z6Uzc5Y2pzOHlTdjY1?=
 =?utf-8?B?Qzg5ZURFdndvekY0RU5qd2JCU3VwRXV4TU9LUHB5YytxbjFKV3hpNVJrMU54?=
 =?utf-8?B?TXltVjYwVXUyTDNWNGFrR1pkZnorNi9aY01lQ1pBMUlRelRaOEVTK3ZiQXBu?=
 =?utf-8?B?R25JWEF3UStSRmRtNFprWnhIOGpZeDVzSmFpZTZBZk44UXh5ZDlmWDZ4YzFX?=
 =?utf-8?B?b3A3OXFhc3pRalU3V0syVXlIWVB5ZGhBR1RORVc5cVRXcFVGa21tY3Ztb0Vk?=
 =?utf-8?B?eWNBZEdydFNuNnpGL3o0eVNoY1k3aFNwZWxtaWpNU08rZGR6Rks5TUFWVS9G?=
 =?utf-8?B?ek9mcmdqODBPM0VKemFGVFZhcWZFaUNERXNqbXh2Ky9PYWt1UmVFakVvS2N2?=
 =?utf-8?B?cm1iRUNFUlhPK3I4YXhRanQ0a0pYQ0FVQmRObkV0NGh4Q0N2TUVibFZBUzBT?=
 =?utf-8?B?YUVpVUR5ZnBOY2dmVndpSEtnRUJicDRqTm1lYUtPY0NWZXJBc1JCbHF3RitX?=
 =?utf-8?B?cDVjcVlIK056QnVCNlNCenB4RzgzQUpNeWUzaDV0ei9xK2lPWlBqaXI0K1Rs?=
 =?utf-8?B?V1lIZzhrOVVMMm9qRHBaREEyZ3dYNmNCSEQyWTRZenF3TFRpS25GcDlTaUha?=
 =?utf-8?B?eDlhRzRjeVhUOUVxWm1YbXBKdEhtRUtheGk2K1E0di9OcENaMXNyeHFCZ1Fm?=
 =?utf-8?B?VFMvTWNCY0NiNiswSWJRVkdIbjlDV29aemJRU3ZISzdZM2tVdFVOejZFVTZo?=
 =?utf-8?B?WmZOSGpPRUdERnFZZ0NlUXBzNFVQeS94US92djZJQzN6Rm5xN2VaNzdGMzln?=
 =?utf-8?B?Rkx3bVEvQ3Q1MFNoRW5lY0Fid0RrN3k5em9zcmNXeGhoOUMvK0J1WGhaOWNY?=
 =?utf-8?B?V3pRN095ZnBSR2dqTHEzNHR2akJOdE1lMSs0UUNMNnlZZDNNWXVoblN0QWJE?=
 =?utf-8?B?L2gxY3hEZVEvcGswMWkxVXZqKzFlaitmOUFqZFFwRW0wdlRNNmV4VXV3WjNl?=
 =?utf-8?B?Vytkd3NmMHJqRU1HcXVEVFhDV1c3cHJ4MVlRNGhrbm9PTWdHdCtIUlgzdFhP?=
 =?utf-8?B?OUdqVkp2Qk1MTUZmNTdRZkhtVVlNc1pHb0dMUzY5eUNPb0c2VTFhYVVqNkRw?=
 =?utf-8?B?a1EzNmRGNUtVbWNyRDFGa25IV29PM2R2emRwRHd4RjdRTUozd3hUS1Bpa2Jh?=
 =?utf-8?B?TVBKSXYzVWRTc1pqTHF1dThvUUptV0JyRGlrdXI2VUVSR2xsZ3FQSzZ6QnFD?=
 =?utf-8?B?cVQ1ak82UGtwUjJVNFNncE9VSURza256eFNCSnJtenJnTlk2bTdJL2l2T0Jw?=
 =?utf-8?Q?hy7mLoL+vKcaipZ706Fl+DKRM?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fbfc737-aa36-44b7-2892-08db72844160
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4445.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 18:20:56.5422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: imahQGkpUgmU3UWOh30+NCLT14sxMdwncFQFBtTO3YHtx5XNIQmhyp4GMhuW2kYc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR01MB8350
X-Mailman-Approved-At: Thu, 22 Jun 2023 04:32:35 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/21/2023 2:01 PM, Jeff Layton wrote:
> On Wed, 2023-06-21 at 13:29 -0400, Tom Talpey wrote:
>> On 6/21/2023 10:45 AM, Jeff Layton wrote:
>>> struct timespec64 has unused bits in the tv_nsec field that can be used
>>> for other purposes. In future patches, we're going to change how the
>>> inode->i_ctime is accessed in certain inodes in order to make use of
>>> them. In order to do that safely though, we'll need to eradicate raw
>>> accesses of the inode->i_ctime field from the kernel.
>>>
>>> Add new accessor functions for the ctime that we can use to replace them.
>>>
>>> Signed-off-by: Jeff Layton <jlayton@kernel.org>
>>> ---
>>>    fs/inode.c         | 16 ++++++++++++++
>>>    include/linux/fs.h | 53 +++++++++++++++++++++++++++++++++++++++++++++-
>>>    2 files changed, 68 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/fs/inode.c b/fs/inode.c
>>> index d37fad91c8da..c005e7328fbb 100644
>>> --- a/fs/inode.c
>>> +++ b/fs/inode.c
>>> @@ -2499,6 +2499,22 @@ struct timespec64 current_time(struct inode *inode)
>>>    }
>>>    EXPORT_SYMBOL(current_time);
>>>    
>>> +/**
>>> + * inode_ctime_set_current - set the ctime to current_time
>>> + * @inode: inode
>>> + *
>>> + * Set the inode->i_ctime to the current value for the inode. Returns
>>> + * the current value that was assigned to i_ctime.
>>> + */
>>> +struct timespec64 inode_ctime_set_current(struct inode *inode)
>>> +{
>>> +	struct timespec64 now = current_time(inode);
>>> +
>>> +	inode_set_ctime(inode, now);
>>> +	return now;
>>> +}
>>> +EXPORT_SYMBOL(inode_ctime_set_current);
>>> +
>>>    /**
>>>     * in_group_or_capable - check whether caller is CAP_FSETID privileged
>>>     * @idmap:	idmap of the mount @inode was found from
>>> diff --git a/include/linux/fs.h b/include/linux/fs.h
>>> index 6867512907d6..9afb30606373 100644
>>> --- a/include/linux/fs.h
>>> +++ b/include/linux/fs.h
>>> @@ -1474,7 +1474,58 @@ static inline bool fsuidgid_has_mapping(struct super_block *sb,
>>>    	       kgid_has_mapping(fs_userns, kgid);
>>>    }
>>>    
>>> -extern struct timespec64 current_time(struct inode *inode);
>>> +struct timespec64 current_time(struct inode *inode);
>>> +struct timespec64 inode_ctime_set_current(struct inode *inode);
>>> +
>>> +/**
>>> + * inode_ctime_peek - fetch the current ctime from the inode
>>> + * @inode: inode from which to fetch ctime
>>> + *
>>> + * Grab the current ctime from the inode and return it.
>>> + */
>>> +static inline struct timespec64 inode_ctime_peek(const struct inode *inode)
>>> +{
>>> +	return inode->i_ctime;
>>> +}
>>> +
>>> +/**
>>> + * inode_ctime_set - set the ctime in the inode to the given value
>>> + * @inode: inode in which to set the ctime
>>> + * @ts: timespec value to set the ctime
>>> + *
>>> + * Set the ctime in @inode to @ts.
>>> + */
>>> +static inline struct timespec64 inode_ctime_set(struct inode *inode, struct timespec64 ts)
>>> +{
>>> +	inode->i_ctime = ts;
>>> +	return ts;
>>> +}
>>> +
>>> +/**
>>> + * inode_ctime_set_sec - set only the tv_sec field in the inode ctime
>>
>> I'm curious about why you choose to split the tv_sec and tv_nsec
>> set_ functions. Do any callers not set them both? Wouldn't a
>> single call enable a more atomic behavior someday?
>>
>>     inode_ctime_set_sec_nsec(struct inode *, time64_t, time64_t)
>>
>> (or simply initialize a timespec64 and use inode_ctime_spec() )
>>
> 
> Yes, quite a few places set the fields individually. For example, when
> loading a value from disk that doesn't have sufficient granularity to
> set the nsecs field to anything but 0.

Well, they still need to set the tv_nsec so they could just pass 0.
But ok.

> Could I have done it by declaring a local timespec64 variable and just
> use the inode_ctime_set function in these places? Absolutely.
> 
> That's a bit more difficult to handle with coccinelle though. If someone
> wants to suggest a way to do that without having to change all of these
> call sites manually, then I'm open to redoing the set.
> 
> That might be better left for a later cleanup though.

Acked-by: Tom Talpey <tom@talpey.com>

>>> + * @inode: inode in which to set the ctime
>>> + * @sec:  value to set the tv_sec field
>>> + *
>>> + * Set the sec field in the ctime. Returns @sec.
>>> + */
>>> +static inline time64_t inode_ctime_set_sec(struct inode *inode, time64_t sec)
>>> +{
>>> +	inode->i_ctime.tv_sec = sec;
>>> +	return sec;
>>> +}
>>> +
>>> +/**
>>> + * inode_ctime_set_nsec - set only the tv_nsec field in the inode ctime
>>> + * @inode: inode in which to set the ctime
>>> + * @nsec:  value to set the tv_nsec field
>>> + *
>>> + * Set the nsec field in the ctime. Returns @nsec.
>>> + */
>>> +static inline long inode_ctime_set_nsec(struct inode *inode, long nsec)
>>> +{
>>> +	inode->i_ctime.tv_nsec = nsec;
>>> +	return nsec;
>>> +}
>>>    
>>>    /*
>>>     * Snapshotting support.
> 
